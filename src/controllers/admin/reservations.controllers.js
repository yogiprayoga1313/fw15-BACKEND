const errorHandler = require("../../helpers/erorHandler.helper")
const reservationsModels = require("../../models/reservations.models")

exports.getAllReservations = async (request, response) => {
    console.log(request.query)
    try { 
        const sortWhaitlist = ["eventId", "userId", "statusId", "paymentMethod"]
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

        const data = await reservationsModels.findAllReservations(request.query.page, 
            request.query.limit, 
            request.query.search,
            request.query.sort,
            request.query.sortBy)
        return response.json({
            success: true,
            message: "List off all Reservation",
            results: data
        })
  
    } 
    catch (error) {
        console.log(error)
        return errorHandler(response, error)
  
    }
}

exports.getOneReservation = async (request, response) => {
    // console.log("check")
    try {
        console.log(parseInt(request.params.id))
        if(isNaN(request.params.id) && parseInt(request.params.id) !== request.params.id){
            return response.status(400).json({
                success:false,
                message: "Parameter id must be number!"
            })
        }
        const data = await reservationsModels.findOne(request.params.id)
        console.log(data)
        if(data){
            console.log(data)
            return response.json({
                success: true,
                message: "Detail Reservation",
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

exports.createReservations = async (request, response) => {
    // console.log(request)
    try{
        if(!request.body.eventId ||
          !request.body.userId ||
          !request.body.statusId ||
          !request.body.paymentMethodId ){
            throw Error("invalid_data")
        }
        const categories = await reservationsModels.insert(request.body)
        return response.json({
            success: true,
            message: "Creat Reservation success",
            results: categories
        })
    }catch(err){
        return errorHandler(response, err) 
    }
}

exports.updateReservations = async (request, response) => {
    // console.log(resultUpdate)
    try{
        const resultUpdate = await reservationsModels.update(request.params.id, request.body)
        if(resultUpdate){
            return response.json({
                success: true,
                message: "Update Reservation sucessfully",
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


exports.deleteReservations = async (request, response) => {
    try{
        const resultCategories = await reservationsModels.findOne(request.params.id)
        if(!resultCategories){
            return response.status(404).json({
                success: false,
                message: "Error : Data Reservation not found",
                results: ""
            })
        }
        await reservationsModels.destroy(request.params.id)
        return response.json({
            success: true,
            message: "Delete Reservation sucessfully",
            results : ""
        })
    }
    catch(err){
        return errorHandler(response, err)
    }
}
