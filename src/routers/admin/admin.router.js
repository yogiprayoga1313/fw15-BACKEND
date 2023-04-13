const admin = require("express").Router()

admin.use("/users", require("./users.routers"))
admin.use("/categories", require("./categories.router"))

module.exports = admin
