const errorHandler = require("../helpers/erorHandler.helper")
const userModel = require("../models/users.model")
const eventsModels = require("../models/events.models")
const reservationModel = require("../models/reservations.models")
const ticketModel = require("../models/reservationTickets.models")
const jwt_decode = require("jwt-decode")
const sectionModel = require ("../models/reservationSection.models")

exports.createReservation = async (request, response) => {
    try {
        if (!request.body.eventId) {
            return response.status(400).json({
                success: false,
                message: "Data cannot be empty!"
            })
        }
        if (!request.headers.authorization) {
            throw Error("Unauthorized!")
        }
        const bearer = request.headers.authorization.split(" ")[1]
        const bearerDecode = jwt_decode(bearer)
        const userData = await userModel.findOne(bearerDecode.id)
        if (!userData) {
            throw Error("User Not found!")
        }

        const payload = {
            ...request.body,
            userId: userData.id,
        }
        const eventsResults = await eventsModels.findOne(payload.eventId)
        if (!eventsResults) {
            return response.status(404).json({
                sucess: false,
                message: "Events Not Found!"
            })
        }
        const {id: userId} = request.user
        const rsvData = {
            ...request.body,
            userId,
            statusId:1
        }
        const rsv = await reservationModel.insert(rsvData)
        const ticketRsv = {
            ...request.body,
            reservationId: rsv.id
        }
        const section = await sectionModel.findOne(request.body.sectionId)
        
        await ticketModel.insert(ticketRsv)
        return response.json({
            success: true,
            message: "Create Reservation Success",
            results: {
                id: rsv.id,
                events: await eventsModels.findOne(request.body.eventId),
                sectionName: section.name,
                quantity: request.body.quantity,
                pricePerTicket: section.price,
                totalPrice: parseInt(request.body.quantity) * section.price
            }
        })
        // const reservation = await reservationModel.insert(payload)
        // reservation.event = eventsResults
        // reservation.user = {
        //     ...userData,
        //     ...profileData
        // }
        // return response.json({
        //     success: true,
        //     message: "Create Reservation Success",
        //     results: reservation
        // })
    } catch (err) {
        return errorHandler(response, err)
    }
}
