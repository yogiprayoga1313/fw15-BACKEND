const userRouter = require("express").Router()

const userController = require("../../controllers/admin/users.controllers" )
const uploadMiddleware = require("../../middlewares/upload.middleware")
const validate = require("../../middlewares/validator.middleware")
// const multer = require("multer")
// const upload = multer({dest: "upload/"})

userRouter.get("/", userController.getAllUsers)
userRouter.get("/:id", userController.getOneUser)
userRouter.post("/",uploadMiddleware("picture"), validate("createUser"), userController.createUsers)
userRouter.patch("/:id",uploadMiddleware("picture"), validate("createUser"),  userController.updateUser)
userRouter.delete("/:id", userController.deleteUser )

module.exports = userRouter
