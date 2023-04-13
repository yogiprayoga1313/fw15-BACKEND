const categoriesRouter = require("express").Router()

const categoriesController = require("../../controllers/admin/categories.controllers" )
const uploadMiddleware = require("../../middlewares/upload.middleware")
const validate = require("../../middlewares/validator.middleware")
// const multer = require("multer")
// const upload = multer({dest: "upload/"})

// categoriesRouter.get("/", categoriesController.)
// categoriesRouter.get("/:id", categoriesController)
// categoriesRouter.post("/",uploadMiddleware("picture"), validate("createUser"), categoriesController)
// categoriesRouter.patch("/:id",uploadMiddleware("picture"), validate("createUser"),  categoriesController)
// categoriesRouter.delete("/:id", categoriesController)

module.exports = categoriesRouter
