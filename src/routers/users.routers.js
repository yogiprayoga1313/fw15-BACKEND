const userRouter = require("express").Router()

const userController = require("../controllers/users.controllers" )

userRouter.get("/", userController.getAllUsers )
userRouter.post("/", userController.creatUsers)
userRouter.patch("/:id", userController.updateUser)
userRouter.delete("/:id", userController.deleteUser )

module.exports = userRouter
