var admin = require("firebase-admin")

var serviceAccount = require("../../aksaraevents-62655-firebase-adminsdk-vw730-e362ad11b2.json")

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
})

module.exports = admin
