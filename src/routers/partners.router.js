const partnersRouter = require("express").Router()

const partnersControllers = require("../controllers/partners.controller" )

partnersRouter.get("/", partnersControllers.getPartners)

module.exports = partnersRouter
