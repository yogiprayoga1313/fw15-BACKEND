const errorHandler = require("../../helpers/erorHandler.helper")
const reservationSectionModel = require("../../models/reservationSection.models")

exports.getAllReservationSection = async (request, response) => {
    console.log(request.query)
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

        const data = await reservationSectionModel.findAllReservationSection(request.query.page, 
            request.query.limit, 
            request.query.search,
            request.query.sort,
            request.query.sortBy)
        return response.json({
            success: true,
            message: "List off all Reservation Section",
            results: data
        })
  
    } 
    catch (error) {
        console.log(error)
        return errorHandler(response, error)
  
    }
}

exports.getOneReservationSection = async (request, response) => {
    // console.log("check")
    try {
        console.log(parseInt(request.params.id))
        if(isNaN(request.params.id) && parseInt(request.params.id) !== request.params.id){
            return response.status(400).json({
                success:false,
                message: "Parameter id must be number!"
            })
        }
        const data = await reservationSectionModel.findOne(request.params.id)
        console.log(data)
        if(data){
            console.log(data)
            return response.json({
                success: true,
                message: "Detail Reservation Section",
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

exports.createReservationSection = async (request, response) => {
    console.log(request)
    try{
        if(!request.body.name || !request.body.price){
            throw Error("invalid_data")
        }
        const categories = await reservationSectionModel.insert(request.body)
        return response.json({
            success: true,
            message: "Creat Reservation Section success",
            results: categories
        })
    }catch(err){
        return errorHandler(response, err) 
    }
}

exports.updateReservationSection = async (request, response) => {
    // console.log(resultUpdate)
    try{
      
        const resultUpdate = await reservationSectionModel.update(request.params.id, request.body)
        if(resultUpdate){
            return response.json({
                success: true,
                message: "Update Reservation Section sucessfully",
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


exports.deleteReservationSection = async (request, response) => {
    try{
        const resultCategories = await reservationSectionModel.findOne(request.params.id)
        if(!resultCategories){
            return response.status(404).json({
                success: false,
                message: "Error : Data Reservation Section not found",
                results: ""
            })
        }
        await reservationSectionModel.destroy(request.params.id)
        return response.json({
            success: true,
            message: "Delete Reservation Section sucessfully",
            results : ""
        })
    }
    catch(err){
        return errorHandler(response, err)
    }
}
