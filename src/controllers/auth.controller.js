const userModel = require("../models/users.model")
const profileModels = require ("../models/profile.model")
const forgotRequsetModels = require ("../models/forgotRequest.models")
const errorHandler = require("../helpers/erorHandler.helper")
const jwt = require("jsonwebtoken")
const { APP_SECRET } = process.env
const argon = require("argon2")


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
        const {fullName, email, password, confirmPassword } = request.body
        if(!email.includes("@")){
            return response.status(404).json({
                success: false,
                message:"Email must contain @!"
            })
        }
        if(!email.includes(".com")){
            return response.status(404).json({
                success: false,
                message:"Email is Invalid!"
            })
        }
        if (password !== confirmPassword) {
            throw Error("password_unmatch")
        }
        if(!email || !fullName || !password || !confirmPassword){
            return response.status(404).json({
                success: false,
                message:"Data cannot be empty!!"
            })
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
        const {code, email, password, confirmPassword} = request.body
        const find = await forgotRequsetModels.findOneByCodeAndEmail(code, email)
        if(!find){
            throw Error("no_forget_password")
        }
        if (password !== confirmPassword) {
            throw Error("password_unmatch")
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
