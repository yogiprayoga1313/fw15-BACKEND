const admin = require("express").Router()

admin.use("/users", require("./users.routers"))
admin.use("/categories", require("./categories.router"))
admin.use("/citites", require("./citites.router"))
admin.use("/profile", require("./profile.router"))
admin.use("/events", require("./events.router"))

module.exports = admin
