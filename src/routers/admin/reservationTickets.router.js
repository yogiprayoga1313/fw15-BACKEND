const reservationsTicketsRouters = require("express").Router()

const reservationTicketsController = require("../../controllers/admin/reservationTickets.controllers" )

reservationsTicketsRouters.get("/", reservationTicketsController.getAllReservationsTickets)
reservationsTicketsRouters.get("/:id", reservationTicketsController.getOneReservationTickets)
reservationsTicketsRouters.post("/", reservationTicketsController.createReservationsTickets)
reservationsTicketsRouters.patch("/:id", reservationTicketsController.updateReservationsTickets)
reservationsTicketsRouters.delete("/:id", reservationTicketsController.deleteReservationsTickets)


module.exports = reservationsTicketsRouters
