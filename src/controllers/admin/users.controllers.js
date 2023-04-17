const userModel = require("../../models/users.model")
const profileModels = require("../../models/profile.model")
const errorHandler = require("../../helpers/erorHandler.helper")
const argon = require("argon2")


exports.getAllUsers = async (request, response) => {
    console.log(request.query)
    try { 
        const sortWhaitlist = ["username", "email", "id"]
        if(request.query.sort && !sortWhaitlist.includes(request.query.sort)){
            return response.status(400).json({
                success: false,
                message:`Please choose one of the following sorting options: ${sortWhaitlist.join(",")}`
            })
        }

        const sortByWhaitlist = ["asc", "desc"]
        if(request.query.sortBy && !sortByWhaitlist.includes(request.query.sortBy.toLowerCase())){
            return response.status(400).json({
                success: false,
                message:`Please choose one of the following sorting options:  ${sortByWhaitlist.join(",")}`
            })
        }

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
    // console.log("check")
    try {
        console.log(parseInt(request.params.id))
        if(isNaN(request.params.id) && parseInt(request.params.id) !== request.params.id){
            return response.status(400).json({
                success:false,
                message: "Parameter id must be number!"
            })
        }
        const data = await userModel.findOne(request.params.id)
        // console.log(data)
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
        const hash = await argon.hash(request.body.password)
        const data = {
            ...request.body,
            password: hash
        }
        const user = await userModel.insert(data)
        console.log(user)
        await profileModels.insert({
            picture:"",
            fullName:"",
            phoneNumber:"",
            gender:true,
            profession:"",
            nationality:"",
            birthDate:new Date(),
            userId:user.id,
        })
        return response.json({
            success: true,
            message:`Creat users ${request.body.username} successfully`,
            results: user
        })
    }catch(err){
        return  errorHandler(response, err)
        
    }
    
}

exports.updateUser = async (request, response) => {
    try {
        console.log(request.body)
        const hash = await argon.hash(request.body.password)
        const data = {
            ...request.body,
            password: hash
        }
        const resultUpdate = await userModel.update(request.params.id, data)
        console.log(data)
        if(resultUpdate){
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
