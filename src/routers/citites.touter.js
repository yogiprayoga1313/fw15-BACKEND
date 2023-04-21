const cititesRouter = require("express").Router()
// const validate = require("../middlewares/validator.middleware")
// const uploadMiddleware = require("../middlewares/upload.middleware")

const cititesController = require("../controllers/citites.controller" )

cititesRouter.get("/", cititesController.getCitites)

module.exports = cititesRouter
