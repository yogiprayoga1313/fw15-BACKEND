require("dotenv").config({
    path: ".env"
})

const express = require("express")

const app = express()
app.use(express.urlencoded({extended: false}))

app.use("/", require("./src/routers/index"))

app.get("/", (request, response) =>{
    return response.json({
        success: true,
        message:"Backend is running well"
    })
})
const PORT = process.env.PORT
app.listen(PORT, ()=> {
    console.log(`App running on prot ${PORT}`)
})
