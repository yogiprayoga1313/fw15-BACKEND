const errorHandler = require("../../src/helpers/erorHandler.helper")
const wishlistModels = require("../../src/models/wishlist.models")
const jwt_decode = require("jwt-decode")
const userModel = require ("../models/users.model")
const eventsModel = require ("../models/events.models")
// const wishlistsModel = require("../models/wishlist.models")


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
        const wishlist = await wishlistModels.insert(payload)
        return response.json({
            success: true,
            message: "Creat Wishlist success",
            results: wishlist 
        })
    }catch(err){
        return errorHandler(response, err) 
    }
}

exports.deleteWishlist = async (request, response) => {
    try{
        const resultWishlist = await wishlistModels.findOne(request.params.id)
        if(!resultWishlist){
            return response.status(404).json({
                success: false,
                message: "Error : Data Wishlist not found",
                results: ""
            })
        }
        await wishlistModels.destroy(request.params.id)
        return response.json({
            success: true,
            message: "Delete Wishlist sucessfully",
            results : ""
        })
    }
    catch(err){
        return errorHandler(response, err)
    }
}

// exports.checkingWishlist = async (request, response) => {

//     const {id} = request.user

//     const event = request.query
//     // return console.log(event)
//     const eventId = event.eventId

//     console.log(request.body)

//     const checkWislist = await wishlistsModel.findOneByUserIdAndEventId(id, eventId)
//     // return console.log(checkWislist)
//     if(!checkWislist){
//         return response.json({
//             success: false,
//             message: `wishlist event ${eventId} by for user ${id} not found`,
//             results: false
//         })
//     }
//     return response.json({
//         success: true,
//         message: `wishlist event ${eventId} by for user ${id} found`,
//         results: true
//     })

// }

// exports.manageWishlist = async (request, response) => {
//     try {
//         const {id} = request.user
//         const data = {
//             ...request.body,
//             userId: id
//         }
//         const eventId = data.eventId
//         const checkEvent = await eventsModel.findOne(eventId)
//         // console.log(checkEvent)
//         if(!checkEvent){
//             throw Error("data_not_found")
//         }

//         const checkDuplicate = await wishlistsModel.findOneByUserIdAndEventId(id, eventId)
//         if(checkDuplicate){
//             const deleteWishlist = await wishlistsModel.DeleteByUserIdAndEventId(id, eventId)
//             return response.json({
//                 success: true,
//                 message: "remove wishlist success",
//                 results: deleteWishlist
//             })
//         }


//         const wishlist = await wishlistsModel.insert(data)
//         if(!wishlist){
//             throw Error("create_wishlist_failed")
//         }

//         return response.json({
//             success: true,
//             message: "add wishlist success",
//             results: wishlist
//         })
  
//     } catch (err) {
//         return errorHandler(response, err)
//     }

// }
