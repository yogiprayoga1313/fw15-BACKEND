const reservationRouter = require("express").Router()

const reservationsController = require("../controllers/reservations.controller")
// const authMiddleware = require("../middlewares/upload.middleware")

reservationRouter.post("/",reservationsController.createReservation)

module.exports = reservationRouter
