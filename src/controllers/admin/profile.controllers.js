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
            message: "List off all Prfile user",
            results: data
        })
    
    } 
    catch (error) {
        console.log(error)
        return errorHandler(response, error)
    
    }
}

exports.getOneProfile = async (request, response) => {
    // console.log("check")
    try {
        console.log(parseInt(request.params.id))
        if(isNaN(request.params.id) && parseInt(request.params.id) !== request.params.id){
            return response.status(400).json({
                success:false,
                message: "Parameter id must be number!"
            })
        }
        const data = await profileModels.findOne(request.params.id)
        console.log(data)
        if(data){
            console.log(data)
            return response.json({
                success: true,
                message: "Detail Profile",
                results: data
            })
        }
        else{
            console.log(data)
            return response.status(404).json({
                success: false,
                message: "Error : Data not found",
                results: data
            })
        }

    } catch (error) {
        console.log(error)
        return errorHandler(response, error)

    }


}


exports.createProfile = async (request, response) =>{
    try {
        if(!request.file ||
          !request.body.fullName ||
          !request.body.phoneNumber ||
          !request.body.gender ||
          !request.body.profession ||
          !request.body.nationality ||
          !request.body.birthDate){
            throw Error("invalid_data")
        }
        const data = {
            ...request.body
        }
        // console.log(request.file)
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
        if(isNaN(request.params.id) && parseInt(request.params.id) !== request.params.id){
            throw Error("id_empty")
        }
        const resultDataProfile = await profileModels.findOneById(request.params.id)
        if(!resultDataProfile){
            return response.status(400).json({
                success: false,
                message: "Data not found!"
            })
        }
        const data = {
            picture:request.body.picture?? resultDataProfile.picture,
            fullName:request.body.fullName?? resultDataProfile.fullName,
            phoneNumber:request.body.phoneNumber?? resultDataProfile.phoneNumber,
            gender:request.body.gender?? resultDataProfile.gender,
            profession:request.body.profession?? resultDataProfile.profession,
            nationality:request.body.nationality?? resultDataProfile.nationality,
            birthDate:request.body.birthDate?? resultDataProfile.birthDate,
        }
        if (request.file){
            data.picture = request.file.filename
            // console.log(request.file)
        }
        const resultUpdate = await profileModels.update(request.params.id, data)
        if(resultUpdate){
            return response.json({
                success: true,
                message: `Update profile ${request.body.fullName} sucessfully`,
                results: resultUpdate
            })  
        }
        else{
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
        // console.log(request.params.id)
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
