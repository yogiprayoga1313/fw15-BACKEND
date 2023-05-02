const paymentRouter = require("express").Router()

const paymentControllers = require("../controllers/payment.controller" )

paymentRouter.post("/", paymentControllers.createPayment)

module.exports = paymentRouter
