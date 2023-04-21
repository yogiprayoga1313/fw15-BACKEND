const eventsRouter = require("express").Router()

const eventsControllers = require("../controllers/events.controller" )

eventsRouter.get("/", eventsControllers.getEvents)
eventsRouter.get("/:id", eventsControllers.getOneEvents)
eventsRouter.post("/", eventsControllers.createEvents)
eventsRouter.patch("/:id",eventsControllers.updateEvents)

module.exports = eventsRouter
