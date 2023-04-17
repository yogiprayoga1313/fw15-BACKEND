const reservationSectionRouters = require("express").Router()

const reservationSectionControllers = require("../../controllers/admin/reservationSection.controllers" )

reservationSectionRouters.get("/", reservationSectionControllers.getAllReservationSection)
reservationSectionRouters.get("/:id", reservationSectionControllers.getOneReservationSection)
reservationSectionRouters.post("/", reservationSectionControllers.createReservationSection)
reservationSectionRouters.patch("/:id", reservationSectionControllers.updateReservationSection)
reservationSectionRouters.delete("/:id", reservationSectionControllers.deleteReservationSection)


module.exports = reservationSectionRouters
