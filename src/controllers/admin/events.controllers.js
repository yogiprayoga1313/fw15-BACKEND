const eventsModels = require("../../models/events.models")
const deviceTokenModel = require("../../models/deviceToken.models")
const errorHandler = require("../../helpers/erorHandler.helper")
const admin = require("../../helpers/firebase")


exports.getAllEvents = async (request, response) => {
    console.log()  
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
        
        const data = await eventsModels.findAllEvents(request.query.page, 
            request.query.limit, 
            request.query.search,
            request.query.sort,
            request.query.sortBy,
            request.query.location,
            request.query.categories)
        return response.json({
            success: true,
            message: "List off all events",
            results: data
        })
    } 
    catch (error) {
        console.log(error)
        return errorHandler(response, error)

    }
}

exports.getOneEvents = async (request, response) => {
    // console.log("check")
    try {
        console.log(parseInt(request.params.id))
        if(isNaN(request.params.id) && parseInt(request.params.id) !== request.params.id){
            return response.status(400).json({
                success:false,
                message: "Parameter id must be number!"
            })
        }
        const data = await eventsModels.findOne(request.params.id)
        console.log(data)
        if(data){
            console.log(data)
            return response.json({
                success: true,
                message: "Detail Events",
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



exports.createEvents = async (request, response) => {
    try{
        if(!request.file || 
          !request.body.title ||
          !request.body.date ||
          !request.body.cityId ||
          !request.body.descriptions,
        !request.body.categoriesId
        ){
            throw Error("invalid_data")
        }

        const data = {
            ...request.body
        }

        if(request.file){
            data.picture = request.file.path
        }

        const listToken = await deviceTokenModel.findAll(1, 1000)
        const message = listToken.map(item =>({
            token: item.token, notification: {
                title: "there is new events!", 
                body:`${request.body.title} will be held at ${request.body.date}, check it out!` 
            }}))
        const messaging = admin.messaging()
        messaging.sendEach(message)

        const events = await eventsModels.insert(data)
        return response.json({
            success: true,
            message: "Create events success",
            results: events
        })
    }catch(err){
        return errorHandler(response, err) 
    }
}

exports.updateEvents = async (request, response) => {
    try {
        if(!request.params.id || isNaN(request.params.id)){
            throw Error("id_empty")
        }
        if(isNaN(!request.file ||
          !request.body.title ||
          !request.body.date ||
          !request.body.cityId ||
          !request.body.descriptions ||
          !request.body.categories)){
            throw Error("invalid_data")
        }
        const data = {
            ...request.body
        }
        if(request.file){
            data.picture = request.file.path
        }
        const resultUpdate = await eventsModels.update(request.params.id, data)
        // console.log(data)
        if(resultUpdate){
            return response.json({
                success: true,
                message: "Update events sucessfully",
                results: resultUpdate
            })  
        }
        else{
            // console.log(data)
            return response.status(404).json({
                success: false,
                message: "Error : Data events not found",
                results: ""
            })
        }
    } catch (error) {
        return  errorHandler(response, error)
    }
 
}

exports.deleteEvents = async (request, response) => {
    try {
        const resultsUser = await eventsModels.findOne(request.params.id)
        if(!resultsUser){
            return response.status(404).json({
                success: false,
                message: "Error : Data events not found",
                results: ""
            })
        }
        console.log(resultsUser)
        console.log(request.params.id)
        await eventsModels.destroy(request.params.id)
        return response.json({
            success: true,
            message: "Delete evnets sucessfully",
            results : ""
        })
    } catch (error) {
        return  errorHandler(response, error)
    }
  
}
