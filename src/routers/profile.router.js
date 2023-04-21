const profileRouter = require("express").Router()
// const validate = require("../middlewares/validator.middleware")
const uploadMiddleware = require("../middlewares/upload.middleware")
// const authMiddleware = require("../middlewares/auth.middlewares")

const profileControllers = require("../controllers/profile.controller" )

profileRouter.get("/", profileControllers.getProfile)
profileRouter.patch(
    "/",
    uploadMiddleware("picture"),
    profileControllers.updateProfile)

module.exports = profileRouter
