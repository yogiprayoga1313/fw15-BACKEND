// const { response } = require("express")
const userModel = require("../models/users.model")
const errorHandler = require("../helpers/erorHandler.helper")

exports.getAllUsers = async (request, response) => {
    console.log(request.query)
    try {
        const data = await userModel.findAllUsers()
        return response.json({
            success: true,
            message: "List off all user",
            results: data
        })
    
    } 
    catch (error) {
        console.log(error)
        return errorHandler(response, error)
    
    }
}


exports.getOneUser = async (request, response) => {
    console.log("check")
    try {
        const data = await userModel.findOne(request.params.id)
        console.log(data)
        if(data){
            console.log(data)
            return response.json({
                success: true,
                message: "Detail user",
                results: data
            })
        }
        else{
            console.log(data)
            return response.status(404).json({
                success: false,
                message: "Error : Data users not found",
                results: data
            })
        }
    
    } catch (error) {
        console.log(error)
        return errorHandler(response, error)
    
    }
    
    
}


exports.createUsers = async (request, response) =>{
    try {
        const data = await userModel.insert(request.body)
        return response.json({
            success: true,
            message:`Creat users ${request.body.email} successfully`,
            results: data
        })
    }catch(err){
        return  errorHandler(response, err)
        
    }
    
}

exports.updateUser = async (request, response) => {
    try {
        const data = await userModel.update(request.params.id, request.body)
        console.log(data)
        if(data){
            return response.json({
                success: true,
                message: "Update user sucessfully",
                results: data
            })
        }
        else{
            console.log(data)
            return response.status(404).json({
                success: false,
                message: "Error : Data users not found",
                results: data
            })
        }
        
        
    
    } catch (error) {
        return  errorHandler(response, error)
    }
   
}

exports.deleteUser = async (request, response) => {
    try {
        const resultsUser = await userModel.findOne(request.params.id)
        if(!resultsUser){
            return response.status(404).json({
                success: false,
                message: "Error : Data users not found",
                results: ""
            })
        }
        // console.log(resultsUser)
        // console.log(request.params.id)
        await userModel.destroy(request.params.id)
        return response.json({
            success: true,
            message: "Delete user sucessfully",
            results : ""
        })
    } catch (error) {
        return  errorHandler(response, error)
    }
    
}
