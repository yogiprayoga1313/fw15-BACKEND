const cititesModels = require("../../models/citites.models")
const errorHandler = require("../../helpers/erorHandler.helper")



exports.getAllCitites = async (request, response) => {
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

        const data = await cititesModels.findAllCitites(request.query.page, 
            request.query.limit, 
            request.query.search,
            request.query.sort,
            request.query.sortBy)
        return response.json({
            success: true,
            message: "List off all citites",
            results: data
        })

    } 
    catch (error) {
        console.log(error)
        return errorHandler(response, error)

    }
}

exports.getOneCitites = async (request, response) => {
    // console.log("check")
    try {
        console.log(parseInt(request.params.id))
        if(isNaN(request.params.id) && parseInt(request.params.id) !== request.params.id){
            return response.status(400).json({
                success:false,
                message: "Parameter id must be number!"
            })
        }
        const data = await cititesModels.findOne(request.params.id)
        console.log(data)
        if(data){
            console.log(data)
            return response.json({
                success: true,
                message: "Detail citites",
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


exports.createCitites = async (request, response) => {
    // console.log(request)
    try{
        if(!request.body.name){
            return response.json({
                success: false,
                message: "Required body name",
                results: ""
            })
        }
        const data = {
            ...request.body
        }
        if(request.file){
            data.picture = request.file.filename
        }
        const citites = await cititesModels.insert(data)
        return response.json({
            success: true,
            message: "Create citites success",
            results: citites
        })
    }catch(err){
        return errorHandler(response, err) 
    }
}

exports.updateCitites = async (request, response) => {
    try {
        const data = {
            ...request.body
        }
        console.log(data.picture, "data controller")
        if(request.file){
            data.picture = request.file.filename
        }
        const resultUpdate = await cititesModels.update(request.params.id, data)
        // console.log(data)
        if(resultUpdate){
            return response.json({
                success: true,
                message: "Update citites sucessfully",
                results: resultUpdate
            })  
        }
        else{
            // console.log(data)
            return response.status(404).json({
                success: false,
                message: "Error : Data citites not found",
                results: "*"
            })
        }
    } catch (error) {
        return  errorHandler(response, error)
    }
 
}

exports.deleteCitites = async (request, response) => {
    try {
        const resultsUser = await cititesModels.findOne(request.params.id)
        if(!resultsUser){
            return response.status(404).json({
                success: false,
                message: "Error : Data citites not found",
                results: ""
            })
        }
        console.log(resultsUser)
        console.log(request.params.id)
        await cititesModels.destroy(request.params.id)
        return response.json({
            success: true,
            message: "Delete citites sucessfully",
            results : ""
        })
    } catch (error) {
        return  errorHandler(response, error)
    }
  
}
