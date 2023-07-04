const errorHandler = require("../helpers/erorHandler.helper")
const deviceTokenModel = require("../models/deviceToken.models")

exports.saveToken = async (req, res) =>{
    try{
        const {id} = req.user
        const {token} =req.body
        const savedData = await deviceTokenModel.insertToken(id, {token})
        return res.json({
            succes: true,
            message:" Token saved!",
            results: {
                token: savedData.token
            }
        })
    }catch(err){
        return errorHandler(res, err)
    }
}
