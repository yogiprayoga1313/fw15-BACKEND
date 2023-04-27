const eventsRouter = require("express").Router()
const uploadMiddleware = require("../../src/middlewares/upload.middleware")

const eventsControllers = require("../controllers/events.controller" )

eventsRouter.get("/", eventsControllers.getEvents)
eventsRouter.get("/:id", eventsControllers.getOneEvents)
eventsRouter.post("/",uploadMiddleware("picture"), eventsControllers.createEvents)
eventsRouter.patch("/:id",uploadMiddleware("picture"),eventsControllers.updateEvents)

module.exports = eventsRouter
