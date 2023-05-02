const errorHandler = require("../helpers/erorHandler.helper")
const userModel = require ("../models/users.model")
const eventsModels = require ("../models/events.models")
const profileModels = require ("../models/profile.model")
const reservationModel = require ("../models/reservations.models")
const jwt_decode = require("jwt-decode")

exports.createReservation = async (request, response) => {
    try{
        if(!request.body.eventId){
            return response.status(400).json({
                success: false,
                message:"Data cannot be empty!"
            })
        }
        if(!request.headers.authorization){
            throw Error("Unauthorized!")
        }
        const bearer = request.headers.authorization.split(" ")[1]
        const bearerDecode = jwt_decode(bearer)
        const userData = await userModel.findOne(bearerDecode.id)
        const profileData = await profileModels.findOneByUserId(bearerDecode.id)
        if(!userData){
            throw Error("User Not found!")
        }

        const payload = {
            ...request.body,
            userId:userData.id,
        }
        const eventsResults = await eventsModels.findOne(payload.eventId)
        if(!eventsResults){
            return response.status(404).json({
                sucess: false,
                message: "Events Not Found!"
            })
        }
        const reservation = await reservationModel.insert(payload)
        reservation.event = eventsResults
        reservation.user = {
            ...userData,
            ...profileData
        }
        return response.json({
            success: true,
            message: "Create Reservation Success",
            results: reservation
        })
    }catch(err){
        return errorHandler(response, err)
    }
}
