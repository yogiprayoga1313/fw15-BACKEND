const partnersModels = require("../../models/partners.models")
const errorHandler = require("../../helpers/erorHandler.helper")



exports.getAllPartners = async (request, response) => {
    console.log(request.query)
    try { 
        const sortWhaitlist = ["name"]
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

        const data = await partnersModels.findAllPartners(request.query.page, 
            request.query.limit, 
            request.query.search,
            request.query.sort,
            request.query.sortBy)
        return response.json({
            success: true,
            message: "List off all Partners",
            results: data
        })

    } 
    catch (error) {
        console.log(error)
        return errorHandler(response, error)

    }
}

exports.getOnePartners = async (request, response) => {
    // console.log("check")
    try {
        console.log(parseInt(request.params.id))
        if(isNaN(request.params.id) && parseInt(request.params.id) !== request.params.id){
            return response.status(400).json({
                success:false,
                message: "Parameter id must be number!"
            })
        }
        const data = await partnersModels.findOne(request.params.id)
        console.log(data)
        if(data){
            console.log(data)
            return response.json({
                success: true,
                message: "Detail Partners",
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


exports.createPartners = async (request, response) => {
    // console.log(request)
    try{
        if(!request.file || !request.body.name){
            return response.status(404).json({
                success: false,
                message: "Data cannot be empty!"
            })
        }
        const data = {
            ...request.body
        }
        if(request.file){
            data.picture = request.file.path
        }
        const partners = await partnersModels.insert(data)
        return response.json({
            success: true,
            message: "Create Partners success",
            results: partners
        })
    }catch(err){
        return errorHandler(response, err) 
    }
}

exports.updatePartners = async (request, response) => {
    try {
        if(!request.params.id || isNaN(request.params.id)){
            throw Error("id_empty")
        }
        const data = {
            ...request.body
        }
        console.log(data.picture, "data controller")
        if(request.file){
            data.picture = request.file.path
        }
        const resultUpdate = await partnersModels.update(request.params.id, data)
        // console.log(data)
        if(resultUpdate){
            return response.json({
                success: true,
                message: "Update Partners sucessfully",
                results: resultUpdate
            })  
        }
        else{
            // console.log(data)
            return response.status(404).json({
                success: false,
                message: "Error : Data Partners not found",
                results: ""
            })
        }
    } catch (error) {
        return  errorHandler(response, error)
    }
 
}

exports.deletePartners = async (request, response) => {
    try {
        const resultsUser = await partnersModels.findOne(request.params.id)
        if(!resultsUser){
            return response.status(404).json({
                success: false,
                message: "Error : Data Partners not found",
                results: ""
            })
        }
        console.log(resultsUser)
        console.log(request.params.id)
        await partnersModels.destroy(request.params.id)
        return response.json({
            success: true,
            message: "Delete Partners sucessfully",
            results : ""
        })
    } catch (error) {
        return  errorHandler(response, error)
    }
  
}
