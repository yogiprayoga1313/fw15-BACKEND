const errorHandler = require("../helpers/erorHandler.helper")
const userModel = require("../models/users.model")
const eventsModels = require("../models/events.models")
const reservationModel = require("../models/reservations.models")
const ticketModel = require("../models/reservationTickets.models")
const jwt_decode = require("jwt-decode")
const sectionModel = require ("../models/reservationSection.models")

exports.createReservation = async (req, response) => {
    try {
        if (!req.body.eventId,
        !req.body.quantity,
        !req.body.sectionId) {
            return response.status(400).json({
                success: false,
                message: "Data cannot be empty!"
            })
        }
        if (!req.headers.authorization) {
            throw Error("Unauthorized!")
        }
        const bearer = req.headers.authorization.split(" ")[1]
        const bearerDecode = jwt_decode(bearer)
        const userData = await userModel.findOne(bearerDecode.id)
        if (!userData) {
            throw Error("User Not found!")
        }

        const payload = {
            ...req.body,
            userId: userData.id,
        }
        const eventsResults = await eventsModels.findOne(payload.eventId)
        if (!eventsResults) {
            return response.status(404).json({
                sucess: false,
                message: "Events Not Found!"
            })
        }
        const {id: userId} = req.user
        const rsvData = {
            ...req.body,
            userId,
            statusId:1
        }
        const rsv = await reservationModel.insert(rsvData)
        const ticketRsv = {
            ...req.body,
            reservationId: rsv.id
        }
        const section = await sectionModel.findOne(req.body.sectionId)
        
        await ticketModel.insert(ticketRsv)
        return response.json({
            success: true,
            message: "Create Reservation Success",
            results: {
                id: rsv.id,
                events: await eventsModels.findOne(req.body.eventId),
                sectionName: section.name,
                quantity: req.body.quantity,
                pricePerTicket: section.price,
                totalPrice: parseInt(req.body.quantity) * section.price
            }
            
        })
    } catch (err) {
        return errorHandler(response, err)
    }
}
