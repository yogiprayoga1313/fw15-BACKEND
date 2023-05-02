const paymentMethodModels = require ("../models/paymentMethod.models")
const errorHandler = require("../helpers/erorHandler.helper")
// const profileModels = require ("../models/profile.model")
const userModel = require("../models/users.model")
const reservationModel = require ("../models/reservations.models")
const reservationStatusModels = require("../models/reservationStatus.models")
const jwt_decode = require("jwt-decode")


exports.createPayment = async (request, response) =>  {
    try{
        if(!request.headers.authorization){
            throw Error("Unauthorized!")
        }
        const bearer = request.headers.authorization.split(" ")[1]
        const bearerDecode = jwt_decode(bearer)
        const userData = await userModel.findOne(bearerDecode.id)
        // const profileData = await profileModels.findOneByUserId(bearerDecode.id)
        if(!userData){
            throw Error("User Not found!")
        }
        const payload = {
            ...request.body,
            userId:userData.id
        }
        const paymentMethod = await paymentMethodModels.findOne(request.body.paymentMethodId)
        console.log(paymentMethod)
        if(!paymentMethod){
            throw Error("paymentMethod_invalid")
        }
        const statusId =  await reservationStatusModels.findOne(request.body.statusId)
        console.log(statusId)
        if(!statusId){
            throw Error("StatusId_invalid")
        }
        const reservation = await reservationModel.findOne(request.body.reservationId)
        console.log(reservation)
        if(!reservation){
            throw Error("reservation_Invalid")
        }
        const payment = await paymentMethodModels.updatePaymentStatus(payload)
        // console.log(payload,"dimana ini??")
        // payment.user = {
        //     ...userData,
        //     ...profileData
        // }
        return response.json({
            success: true,
            message:"Create Payment Success",
            results: payment
        })
    }catch(err){
        return errorHandler(response, err)
    }
}
