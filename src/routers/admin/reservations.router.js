const reservationsRouters = require("express").Router()

const reservationController = require("../../controllers/admin/reservations.controllers" )

reservationsRouters.get("/", reservationController.getAllReservations)
reservationsRouters.get("/:id", reservationController.getOneReservation)
reservationsRouters.post("/", reservationController.createReservations)
reservationsRouters.patch("/:id", reservationController.updateReservations)
reservationsRouters.delete("/:id", reservationController.deleteReservations)


module.exports = reservationsRouters
