const jwt_decode = require("jwt-decode")
const userModel = require("../models/users.model")
const argon = require("argon2")
const changePasswordModels = require ("../models/changePassword.model")
const errorHandler = require("../helpers/erorHandler.helper")



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
        // console.log(request.body)
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
