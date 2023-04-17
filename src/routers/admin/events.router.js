const eventsRouters = require("express").Router()

const uploadMiddleware = require("../../middlewares/upload.middleware")
const eventsControllers = require("../../controllers/admin/events.controllers")

eventsRouters.get("/", eventsControllers.getAllEvents)
eventsRouters.get("/:id", eventsControllers.getOneEvents)
eventsRouters.post("/",uploadMiddleware("picture"), eventsControllers.createEvents)
eventsRouters.patch("/:id",uploadMiddleware("picture"), eventsControllers.updateEvents)
eventsRouters.delete("/:id", eventsControllers.deleteEvents)



module.exports = eventsRouters
