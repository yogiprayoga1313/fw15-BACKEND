const cititesRouters = require("express").Router()
const uploadMiddleware = require("../../middlewares/upload.middleware")

const cititesControllers = require("../../controllers/admin/citites.controllers")

cititesRouters.get("/", cititesControllers.getAllCitites)
cititesRouters.get("/:id", cititesControllers.getOneCitites)
cititesRouters.post("/",uploadMiddleware("picture"), cititesControllers.createCitites)
cititesRouters.patch("/:id",uploadMiddleware("picture"), cititesControllers.updateCitites)
cititesRouters.delete("/:id", cititesControllers.deleteCitites)



module.exports = cititesRouters

