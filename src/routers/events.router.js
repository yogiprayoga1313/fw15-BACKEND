const eventsRouter = require("express").Router()
const uploadMiddleware = require("../../src/middlewares/upload.middleware")

const eventsControllers = require("../controllers/events.controller" )

eventsRouter.get("/", eventsControllers.getAllEvents)
eventsRouter.get("/manage/:id", eventsControllers.getOneEvents)
eventsRouter.get("/manage", eventsControllers.getEvents)
eventsRouter.post("/manage",uploadMiddleware("picture"), eventsControllers.createEvents)
eventsRouter.patch("/manage/:id",uploadMiddleware("picture"),eventsControllers.updateEvents)
eventsRouter.get("/:id", eventsControllers.getOneEvents)

module.exports = eventsRouter
