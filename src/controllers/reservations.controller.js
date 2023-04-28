const errorHandler = require("../helpers/erorHandler.helper")
const userModel = require ("../models/users.model")
const eventsModels = require ("../models/events.models")
const profileModels = require ("../models/profile.model")
const reservationModel = require ("../models/reservations.models")
const jwt_decode = require("jwt-decode")

exports.createReservation = async (request, response) => {
    try{
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
        console.log(request.body)
        const eventsResults = await eventsModels.findOne(payload.eventId)
        console.log(eventsResults)
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
