const admin = require("express").Router()

admin.use("/users", require("./users.routers"))
admin.use("/categories", require("./categories.router"))
admin.use("/citites", require("./citites.router"))
admin.use("/profile", require("./profile.router"))
admin.use("/events", require("./events.router"))
admin.use("/eventCategories", require("./eventCategories.router"))
admin.use("/partners", require("./partners.router"))
admin.use("/reservationSection", require("./reservationSection.router"))
admin.use("/reservationStatus", require("./reservationStatus.router"))
admin.use("/paymentMethod", require("./paymentMethod.router"))
admin.use("/reservations", require("./reservations.router"))
admin.use("/reservationsTickets", require("./reservationTickets.router"))
admin.use("/wishlist", require("./wishlist.routers"))

module.exports = admin
