const eventsModels = require("../../src/models/events.models")
const errorHandler = require("../../src/helpers/erorHandler.helper")
const jwt_decode = require("jwt-decode")
const userModel = require ("../models/users.model")


exports.getEvents = async (request, response) => {
    console.log(request.query)
    try {
        if(!request.headers.authorization){
            throw Error("Unauthorized!")
        }
        const bearer = request.headers.authorization.split(" ")[1]
        const bearerDecode = jwt_decode(bearer)
        const userData = await userModel.findOne(bearerDecode.id)
        console.log(userData, bearerDecode)
        if(!userData){
            throw Error("User Not found!")
        }
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

        const data = await eventsModels.findEvents(request.query.page, 
            request.query.limit, 
            request.query.search,
            request.query.sort,
            request.query.sortBy,
            request.query.location,
            request.query.categories,
            userData.id)
        return response.json({
            success: true,
            message: "List off events",
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
        if(!request.headers.authorization){
            throw Error("Unauthorized!")
        }
        const bearer = request.headers.authorization.split(" ")[1]
        const bearerDecode = jwt_decode(bearer)
        const userData = await userModel.findOne(bearerDecode.id)
        if(!userData){
            throw Error("User Not found!")
        }
        console.log(request.body)
        if(!request.body.title){
            return response.json({
                success: false,
                message: "Required body title",
                results: ""
            })
        }

        const data = {
            ...request.body,
            userId:userData.id
        }
        if(request.file){
            data.picture = request.file.filename
        }
        const citites = await eventsModels.insert(data)
        return response.json({
            success: true,
            message: "Create events success",
            results: citites
        })
    }catch(err){
        return errorHandler(response, err) 
    }
}

exports.updateEvents = async (request, response) => {
    try {
        if(!request.headers.authorization){
            throw Error("Unauthorized!")
        }
        const bearer = request.headers.authorization.split(" ")[1]
        const bearerDecode = jwt_decode(bearer)
        const userData = await userModel.findOne(bearerDecode.id)
        if(!userData){
            throw Error("User Not found!")
        }
        // console.log(data.picture, "data controller")
        const findEvents = await eventsModels.findOneByUserid({
            id:request.params.id,
            userId:userData.id
        })
        console.log(findEvents)
        if(!findEvents){
            return response.status(404).json({
                success:false,
                message: "Events not Found!"
            })
        }
        const data = {
            picture:findEvents.picture,
            title:request.body.title?? findEvents.title,
            date:request.body.date?? findEvents.date,
            descriptions:request.body.descriptions?? findEvents.descriptions,
            categoriesId:request.body.categoriesId?? findEvents.descriptions,
            cityId:request.body.cityId?? findEvents.cityId
        }
        // console.log(data)
        if(request.file){
            data.picture = request.file.filename
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
                results: "*"
            })
        }
    } catch (error) {
        return  errorHandler(response, error)
    }

}