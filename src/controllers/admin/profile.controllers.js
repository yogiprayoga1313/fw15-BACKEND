const profileModels = require("../../models/profile.model")
const errorHandler = require("../../helpers/erorHandler.helper")
// const argon = require("argon2")


exports.getAllProfile = async (request, response) => {
    console.log(request.query)
    try { 
        const sortWhaitlist = ["fullName", "phoneNumber", "gender", "profession", "nationality"]
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

        const data = await profileModels.findAllProfile(request.query.page, 
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


exports.createProfile = async (request, response) =>{
    try {
        const data = {
            ...request.body
        }
        console.log(request.file)
        if (request.file){
            data.picture = request.file.filename
        }
        const profile = await profileModels.insert(data)
        return response.json({
            success: true,
            message:`Create profile ${request.body.fullName} successfully`,
            results: profile
        })
    }catch(err){
        return  errorHandler(response, err)
      
    }
  
}

exports.updateProfile = async (request, response) => {
    try {
        console.log(request.body)
        const data = {
            ...request.body
        }
        console.log(request.file, "datanya ada")
        if (request.file){
            data.picture = request.file.filename
        }
        const resultUpdate = await profileModels.update(request.params.id, request.body)
        // console.log(data)
        if(resultUpdate){
            return response.json({
                success: true,
                message: `Update profile ${request.body.fullName} sucessfully`,
                results: resultUpdate
            })  
        }
        else{
            // console.log(data)
            return response.status(404).json({
                success: false,
                message: "Error : Data citites not found",
                results: ""
            })
        }
    } catch (error) {
        return  errorHandler(response, error)
    }

}

exports.deleteProfile = async (request, response) => {
    try {
        const resultsUser = await profileModels.findOne(request.params.id)
        if(!resultsUser){
            return response.status(404).json({
                success: false,
                message: "Error : Data profile not found",
                results: ""
            })
        }
        console.log(resultsUser)
        console.log(request.params.id)
        await profileModels.destroy(request.params.id)
        return response.json({
            success: true,
            message: "Delete profile sucessfully",
            results : ""
        })
    } catch (error) {
        return  errorHandler(response, error)
    }

}
