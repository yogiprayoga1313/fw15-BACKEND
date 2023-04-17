const partnersRouters = require("express").Router()
const uploadMiddleware = require("../../middlewares/upload.middleware")

const partnersControllers = require("../../controllers/admin/partners.controllers")

partnersRouters.get("/", partnersControllers.getAllPartners)
partnersRouters.get("/:id", partnersControllers.getOnePartners)
partnersRouters.post("/",uploadMiddleware("picture"), partnersControllers.createPartners)
partnersRouters.patch("/:id",uploadMiddleware("picture"), partnersControllers.updatePartners)
partnersRouters.delete("/:id", partnersControllers.deletePartners)



module.exports = partnersRouters
