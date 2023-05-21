const reservationModel = require("../models/reservations.models")
const sectionModel = require("../models/reservationSection.models")
const eventsModels = require("../models/events.models")
const ticketModel = require("../models/reservationTickets.models")
const erorHandler = require ("../helpers/erorHandler.helper")

exports.createPayment = async (req, res)=> {
    try {
        const { id: userId } = req.user
        const rsv = await reservationModel.findOne(req.body.reservationId)
        if(rsv.userId !== userId) {
            throw (Error("data_missmatch"))
        }
        const update = await reservationModel.update(req.body.reservationId,{
            paymentMethodId:req.body.paymentMethodId,
            statusId: 2
        })
        const ticket = await ticketModel.findOneByReservationId(update.id)

        const section = await sectionModel.findOne(ticket.sectionId)
        console.log(update)
        return res.json({
            success: true,
            message: "Create payment Success",
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
        return erorHandler(res, err)
    }
}
