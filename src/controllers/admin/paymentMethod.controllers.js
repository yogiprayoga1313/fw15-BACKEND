const errorHandler = require("../../helpers/erorHandler.helper")
const paymentMethodModels = require("../../models/paymentMethod.models")

exports.getAllPaymentMethod = async (request, response) => {
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

        const data = await paymentMethodModels.findAllPaymentMethod(request.query.page, 
            request.query.limit, 
            request.query.search,
            request.query.sort,
            request.query.sortBy)
        return response.json({
            success: true,
            message: "List off all Payment Method Status",
            results: data
        })
  
    } 
    catch (error) {
        console.log(error)
        return errorHandler(response, error)
  
    }
}

exports.getOnePaymentMethod = async (request, response) => {
    // console.log("check")
    try {
        console.log(parseInt(request.params.id))
        if(isNaN(request.params.id) && parseInt(request.params.id) !== request.params.id){
            return response.status(400).json({
                success:false,
                message: "Parameter id must be number!"
            })
        }
        const data = await paymentMethodModels.findOne(request.params.id)
        console.log(data)
        if(data){
            console.log(data)
            return response.json({
                success: true,
                message: "Detail categories",
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

exports.createPaymentMethod = async (request, response) => {
    try{
        if(!request.body.name){
            return response.json({
                success: false,
                message: "Required body name",
                results: ""
            })
        }
        const categories = await paymentMethodModels.insert(request.body)
        return response.json({
            success: true,
            message: "Creat Payment Method success",
            results: categories
        })
    }catch(err){
        return errorHandler(response, err) 
    }
}

exports.updatePaymentMethod = async (request, response) => {
    // console.log(resultUpdate)
    try{
        const resultUpdate = await paymentMethodModels.update(request.params.id, request.body)
        if(resultUpdate){
            return response.json({
                success: true,
                message: "Update Payment Method sucessfully",
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


exports.deletePaymentMethod = async (request, response) => {
    try{
        const resultCategories = await paymentMethodModels.findOne(request.params.id)
        if(!resultCategories){
            return response.status(404).json({
                success: false,
                message: "Error : Data Payment Method not found",
                results: ""
            })
        }
        await paymentMethodModels.destroy(request.params.id)
        return response.json({
            success: true,
            message: "Delete Payment Method sucessfully",
            results : ""
        })
    }
    catch(err){
        return errorHandler(response, err)
    }
}
