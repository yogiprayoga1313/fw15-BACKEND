const categoriesRouter = require("express").Router()

const categoriesController = require("../../controllers/admin/categories.controllers" )

categoriesRouter.get("/", categoriesController.getAllCategories)
categoriesRouter.get("/:id", categoriesController.getOneCategories)
categoriesRouter.post("/", categoriesController.createCategories)
categoriesRouter.patch("/:id", categoriesController.updateCategories)
categoriesRouter.delete("/:id", categoriesController.deleteCategories)


module.exports = categoriesRouter
