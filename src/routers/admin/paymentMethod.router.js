const paymentMethodRouters = require("express").Router()

const paymentMethodControllers = require("../../controllers/admin/paymentMethod.controllers" )

paymentMethodRouters.get("/", paymentMethodControllers.getAllPaymentMethod)
paymentMethodRouters.get("/:id", paymentMethodControllers.getOnePaymentMethod)
paymentMethodRouters.post("/", paymentMethodControllers.createPaymentMethod)
paymentMethodRouters.patch("/:id", paymentMethodControllers.updatePaymentMethod)
paymentMethodRouters.delete("/:id", paymentMethodControllers.deletePaymentMethod)


module.exports = paymentMethodRouters
