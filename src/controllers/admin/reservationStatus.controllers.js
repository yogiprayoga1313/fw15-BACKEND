const errorHandler = require("../../helpers/erorHandler.helper")
const reservationStatus = require("../../models/reservationStatus.models")

exports.getAllResevationStatus = async (request, response) => {
    try { 
        const sortWhaitlist = ["name"]
        if(request.query.sort && !sortWhaitlist.includes(request.query.sort)){
            return response.status(400).json({
                success: false,
                message:`Please choose one of the following sorting options: ${sortWhaitlist.join(",")}`
            })
        }

        const sortByWhaitlist = ["asc", "desc"]
        if(request.query.sortBy && !sortByWhaitlist.includes(request.query.sortBy.toLowerCase())){
            return response.status(400).json({
                success: false,
                message:`Please choose one of the following sorting options:  ${sortByWhaitlist.join(",")}`
            })
        }

        const data = await reservationStatus.findAllReservationStatus(request.query.page, 
            request.query.limit, 
            request.query.search,
            request.query.sort,
            request.query.sortBy)
        return response.json({
            success: true,
            message: "List off all Reservation Status",
            results: data
        })
  
    } 
    catch (error) {
        console.log(error)
        return errorHandler(response, error)
  
    }
}

exports.getOneReservationStatus = async (request, response) => {
    // console.log("check")
    try {
        console.log(parseInt(request.params.id))
        if(isNaN(request.params.id) && parseInt(request.params.id) !== request.params.id){
            return response.status(400).json({
                success:false,
                message: "Parameter id must be number!"
            })
        }
        const data = await reservationStatus.findOne(request.params.id)
        console.log(data)
        if(data){
            console.log(data)
            return response.json({
                success: true,
                message: "Detail Reservation Status",
                results: data
            })
        }
        else{
            console.log(data)
            return response.status(404).json({
                success: false,
                message: "Error : Data not found",
                results: data
            })
        }

    } catch (error) {
        console.log(error)
        return errorHandler(response, error)

    }


}


exports.createResevationStatus = async (request, response) => {
    console.log(request)
    try{
        if(!request.body.name){
            throw Error("invalid_data")
        }
        const categories = await reservationStatus.insert(request.body)
        return response.json({
            success: true,
            message: "Creat Reservation Status success",
            results: categories
        })
    }catch(err){
        return errorHandler(response, err) 
    }
}

exports.updateResevationStatus = async (request, response) => {
    // console.log(resultUpdate)
    try{
        const resultUpdate = await reservationStatus.update(request.params.id, request.body)
        if(resultUpdate){
            return response.json({
                success: true,
                message: "Update Reservation Status sucessfully",
                results: resultUpdate
            })
        }
        else{
            return response.status(404).json({
                success: false,
                message: "Error : Data not found",
                results: ""
            })
        }
    }
    catch(err){
        return errorHandler(response, err)
    }
}


exports.deleteResevationStatus = async (request, response) => {
    try{
        const resultCategories = await reservationStatus.findOne(request.params.id)
        if(!resultCategories){
            return response.status(404).json({
                success: false,
                message: "Error : Data Reservation Status not found",
                results: ""
            })
        }
        await reservationStatus.destroy(request.params.id)
        return response.json({
            success: true,
            message: "Delete Reservation Status sucessfully",
            results : ""
        })
    }
    catch(err){
        return errorHandler(response, err)
    }
}
