const eventCategoriesRouter = require("express").Router()

const eventCategoriesController = require("../../controllers/admin/eventCategories.controllers" )

eventCategoriesRouter.get("/", eventCategoriesController.getAllEventCategories)
eventCategoriesRouter.get("/:id", eventCategoriesController.getOneEventsCategories)
eventCategoriesRouter.post("/", eventCategoriesController.createEventCategories)
eventCategoriesRouter.patch("/:id", eventCategoriesController.updateEventCategories)
eventCategoriesRouter.delete("/:id", eventCategoriesController.deleteEventCategories)


module.exports = eventCategoriesRouter
