const errorHandler = require("../../helpers/erorHandler.helper")
const eventCategoriesModels = require("../../models/eventCategories.model")

exports.getAllEventCategories = async (request, response) => {
    console.log(request.query)
    try { 
        const sortWhaitlist = ["eventId"]
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

        const data = await eventCategoriesModels.findAllEventCategoris(request.query.page, 
            request.query.limit, 
            request.query.search,
            request.query.sort,
            request.query.sortBy)
        return response.json({
            success: true,
            message: "List off all Event Categories",
            results: data
        })
  
    } 
    catch (error) {
        console.log(error)
        return errorHandler(response, error)
  
    }
}

exports.getOneEventsCategories = async (request, response) => {
    // console.log("check")
    try {
        console.log(parseInt(request.params.id))
        if(isNaN(request.params.id) && parseInt(request.params.id) !== request.params.id){
            return response.status(400).json({
                success:false,
                message: "Parameter id must be number!"
            })
        }
        const data = await eventCategoriesModels.findOne(request.params.id)
        console.log(data)
        if(data){
            console.log(data)
            return response.json({
                success: true,
                message: "Detail Events Categories",
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

exports.createEventCategories = async (request, response) => {
    // console.log(request)
    try{
        if(!request.body.eventId){
            return response.json({
                success: false,
                message: "Required body Event Id",
                results: ""
            })
        }
        const categories = await eventCategoriesModels.insert(request.body)
        return response.json({
            success: true,
            message: "Creat Event Categories success",
            results: categories
        })
    }catch(err){
        return errorHandler(response, err) 
    }
}

exports.updateEventCategories = async (request, response) => {
    // console.log(resultUpdate)
    try{
        const resultUpdate = await eventCategoriesModels.update(request.params.id, request.body)
        if(resultUpdate){
            return response.json({
                success: true,
                message: "Update Event Categories sucessfully",
                results: resultUpdate
            })
        }
        else{
            return response.status(404).json({
                success: false,
                message: "Error : Data not found",
                results: ""
            })
        }
    }
    catch(err){
        return errorHandler(response, err)
    }
}


exports.deleteEventCategories = async (request, response) => {
    try{
        const resultCategories = await eventCategoriesModels.findOne(request.params.id)
        if(!resultCategories){
            return response.status(404).json({
                success: false,
                message: "Error : Data event categories not found",
                results: ""
            })
        }
        await eventCategoriesModels.destroy(request.params.id)
        return response.json({
            success: true,
            message: "Delete Event categories sucessfully",
            results : ""
        })
    }
    catch(err){
        return errorHandler(response, err)
    }
}
