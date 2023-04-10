const admin = require("express").Router()

admin.use("/users", require("./users.routers"))

module.exports = admin
