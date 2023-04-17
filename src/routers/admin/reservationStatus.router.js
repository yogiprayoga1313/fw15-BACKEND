const reservationStatusRouters = require("express").Router()

const reservationControllers = require("../../controllers/admin/reservationStatus.controllers" )

reservationStatusRouters.get("/", reservationControllers.getAllResevationStatus)
reservationStatusRouters.get("/:id", reservationControllers.getOneReservationStatus)
reservationStatusRouters.post("/", reservationControllers.createResevationStatus)
reservationStatusRouters.patch("/:id", reservationControllers.updateResevationStatus)
reservationStatusRouters.delete("/:id", reservationControllers.deleteResevationStatus)


module.exports = reservationStatusRouters
