const errorHandler = require("../../helpers/erorHandler.helper")
const reservationsTicketsModels = require("../../models/reservationTickets.models")

exports.getAllReservationsTickets = async (request, response) => {
    console.log(request.query)
    try { 
        const sortWhaitlist = ["reservationId", "sectionId", "quantity"]
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

        const data = await reservationsTicketsModels.findAllReservationsTickets(request.query.page, 
            request.query.limit, 
            request.query.search,
            request.query.sort,
            request.query.sortBy)
        return response.json({
            success: true,
            message: "List off all Reservation Tickets",
            results: data
        })
  
    } 
    catch (error) {
        console.log(error)
        return errorHandler(response, error)
  
    }
}

exports.getOneReservationTickets = async (request, response) => {
    // console.log("check")
    try {
        console.log(parseInt(request.params.id))
        if(isNaN(request.params.id) && parseInt(request.params.id) !== request.params.id){
            return response.status(400).json({
                success:false,
                message: "Parameter id must be number!"
            })
        }
        const data = await reservationsTicketsModels.findOne(request.params.id)
        console.log(data)
        if(data){
            console.log(data)
            return response.json({
                success: true,
                message: "Detail Reservation Tickets",
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

exports.createReservationsTickets = async (request, response) => {
    // console.log(request)
    try{
        if(!request.body.reservationId || !request.body.sectionId || !request.body.quantity){
            throw Error("invalid_data")
        }
        const reservationsTickets = await reservationsTicketsModels.insert(request.body)
        return response.json({
            success: true,
            message: "Creat Reservation Tickets success",
            results: reservationsTickets
        })
    }catch(err){
        return errorHandler(response, err) 
    }
}

exports.updateReservationsTickets = async (request, response) => {
    // console.log(resultUpdate)
    try{
        const resultUpdate = await reservationsTicketsModels.update(request.params.id, request.body)
        if(resultUpdate){
            return response.json({
                success: true,
                message: "Update Reservation Tickets sucessfully",
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


exports.deleteReservationsTickets = async (request, response) => {
    try{
        const resultCategories = await reservationsTicketsModels.findOne(request.params.id)
        if(!resultCategories){
            return response.status(404).json({
                success: false,
                message: "Error : Data Reservation Tickets not found",
                results: ""
            })
        }
        await reservationsTicketsModels.destroy(request.params.id)
        return response.json({
            success: true,
            message: "Delete Reservation Tickets sucessfully",
            results : ""
        })
    }
    catch(err){
        return errorHandler(response, err)
    }
}
