const userRouter = require("express").Router()

const userController = require("../../controllers/admin/users.controllers" )
const validate = require("../../middlewares/validator.middleware")
// const uploadMiddleware = require("../../middlewares/upload.middleware")
// const multer = require("multer")
// const upload = multer({dest: "upload/"})

userRouter.get("/", userController.getAllUsers)
userRouter.get("/:id", userController.getOneUser)
userRouter.post("/",validate("createUser"), userController.createUsers)
userRouter.patch("/:id",validate("createUser"),  userController.updateUser)
userRouter.delete("/:id", userController.deleteUser )

module.exports = userRouter
