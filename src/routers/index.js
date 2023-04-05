const router = require("express").Router()

router.use("/users", require("./users.routers"))

module.exports = router
