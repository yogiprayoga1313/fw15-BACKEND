const changePasswordRouter = require("express").Router()

const changePasswordController = require("../controllers/changePassword.controller" )

changePasswordRouter.patch("/", changePasswordController.changePassword)

module.exports = changePasswordRouter
