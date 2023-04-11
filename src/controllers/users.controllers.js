// const { response } = require("express")
const userModel = require("../models/users.model")
const errorHandler = require("../helpers/erorHandler.helper")
const argon = require("argon2")

exports.getAllUsers = async (request, response) => {
    console.log(request.query)
    try {
        const data = await userModel.findAllUsers(request.query.page, 
            request.query.limit, 
            request.query.search,
            request.query.sort,
            request.query.sortBy)
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
        if(!request.body.fullName){
            throw Error("name_empty_field")
        }
        if(!request.body.email && !request.body.password){
            throw Error("empty_field")  
        }
        const hash = await argon.hash(request.body.password)
        const data = {
            ...request.body,
            password: hash
        }
        const user = await userModel.insert(data)
        return response.json({
            success: true,
            message:`Creat users ${request.body.email} successfully`,
            results: user
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
        console.log(resultsUser)
        console.log(request.params.id)
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
