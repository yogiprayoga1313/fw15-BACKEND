const errorHandler = require("../../src/helpers/erorHandler.helper")
const wishlistModels = require("../../src/models/wishlist.models")
const jwt_decode = require("jwt-decode")
const userModel = require ("../models/users.model")
const eventsModel = require ("../models/events.models")


exports.getWishlist = async (request, response) => {
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
        const sortWhaitlist = ["eventId", "userId"]
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

        const data = await wishlistModels.findAllWishlist(request.query.page, 
            request.query.limit, 
            request.query.search,
            request.query.sort,
            request.query.sortBy,
            userData.id)
        return response.json({
            success: true,
            message: "List off all Wishlist",
            results: data
        })

    } 
    catch (error) {
        console.log(error)
        return errorHandler(response, error)

    }
}

exports.createWishlist = async (request, response) => {
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
      
        if(!request.body.eventId){
            return response.json({
                success: false,
                message: "Required body event id",
                results: ""
            })
        }
        const eventData =  await eventsModel.findOne(request.body.eventId)
        if(!eventData){
            return response.status(404).json({
                success: false,
                message:"events not found!"
            })
        }
        const payload = {
            ...request.body,
            userId:userData.id
        }
        const categories = await wishlistModels.insert(payload)
        return response.json({
            success: true,
            message: "Creat Wishlist success",
            results: categories
        })
    }catch(err){
        return errorHandler(response, err) 
    }
}
