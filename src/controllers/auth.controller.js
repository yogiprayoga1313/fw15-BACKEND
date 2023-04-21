const userModel = require("../models/users.model")
const profileModels = require ("../models/profile.model")
const forgotRequsetModels = require ("../models/forgotRequest.models")
const changePasswordModels = require ("../models/changePassword.model")
const errorHandler = require("../helpers/erorHandler.helper")
const jwt = require("jsonwebtoken")
const { APP_SECRET } = process.env
const argon = require("argon2")
const jwt_decode = require("jwt-decode")

exports.login = async (request, response) => {
    try {
        const { email, password } = request.body
        const user = await userModel.findOneByEmail(email)
        if (!user) {
            throw Error("wrong_credentials")
        }
        const verify = await argon.verify(user.password, password)
        if (!verify) {
            throw Error("wrong_credentials")
        }
        const token = jwt.sign({ id: user.id }, APP_SECRET)
        return response.json({
            success: true,
            message: "Login sucess!",
            results: { token }
        })
    } catch (err) {
        return errorHandler(response, err)
    }
}


exports.register = async (request, response) => {
    try {
        const {fullName, password, confirmPassword } = request.body
        if (password !== confirmPassword) {
            throw Error("password_unmatch")
        }
        const hash = await argon.hash(password)
        const data = {
            ...request.body,
            password: hash
        }
        const user = await userModel.insert(data)
        const profileData = {
            fullName,
            userId: user.id,
        }
        await profileModels.insert(profileData)
        const token = jwt.sign({id: user.id}, APP_SECRET)
        return response.json({
            success: true,
            message: "Register success!",
            results: { token }
        })
    } catch (err) {
        return errorHandler(response, err)
    }
}

exports.forgotPassword = async (request, response) => {
    try{
        const {email} = request.body
        const user = await userModel.findOneByEmail(email)
        if(!user){
            throw Error("no_user")
        }
        const randomNumber = Math.random()
        const rounded = Math.round(randomNumber * 100000)
        const padded = String(rounded).padEnd(6, "0")

        const forgot = await forgotRequsetModels.insert({
            email: user.email,
            code: padded
        })
        if(!forgot){
            throw Error ("forget_failed")
        }
        return response.json({
            success : true,
            message : "Request forgot password success!"
        })
    }catch(err){
        return errorHandler(response, err)
    }
}


exports.resetPassword =  async (request, response) => {
    try{
        const {code, email, password} = request.body
        const find = await forgotRequsetModels.findOneByCodeAndEmail(code, email)
        if(!find){
            throw Error("no_forget_password")
        }
        const selectedUser = await userModel.findOneByEmail(email)
        const data = {
            password: await argon.hash(password)
        }
        const user = await userModel.update(selectedUser.id, data)
        if(!user){
            throw Error("no_forget_password")
        }
        return response.json({
            success: true,
            message: "Reset password Success!"
        })
    }catch(err){
        return errorHandler(response, err)
    }
}


exports.changePassword = async(request, response) => {
    try{
        if(!request.headers.authorization){
            throw Error("Unauthorized!")
        }
        const bearer = request.headers.authorization.split(" ")[1]
        const bearerDecode = jwt_decode(bearer)
        const userData = await userModel.findOne(bearerDecode.id)
        if(!userData){
            throw Error("User Not found!")
        }
        console.log(request.body)
        const verify = await argon.verify(userData.password, request.body.oldPassword)
        if (!verify) {
            throw Error("wrong_credentials")
        }
        if(request.body.oldPassword === request.body.newPassword){
            return response.status(400).json({
                success: false,
                message: "Passwords cannot be the same!"
            })
        }
        if(request.body.newPassword !== request.body.confirmPassword){
            return response.status(400).json({
                success : false,
                message: "Password doest not match!"
            })
        }
        const newPasswordArgon = await argon.hash(request.body.newPassword)
        const updatePassword = await changePasswordModels.updatePassword(bearerDecode.id, newPasswordArgon) 
        if(!updatePassword){
            throw Error("Failed Update password")
        }
        return response.json({
            success: true,
            message: "change password Success!"
        })
    }catch(err){
        return errorHandler(response, err)
    }
}
