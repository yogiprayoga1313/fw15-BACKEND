const categoriesRouter = require("express").Router()

const categoriesController = require("../controllers/categories.controller" )

categoriesRouter.get("/", categoriesController.getCategories)

module.exports = categoriesRouter
