const sectionRouter = require("express").Router()

const sectionController = require("../controllers/section.controller" )

sectionRouter.get("/", sectionController.getAllSection)

module.exports = sectionRouter
