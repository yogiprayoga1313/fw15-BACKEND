const errorHandler = require("../../helpers/erorHandler.helper")
const categoriesModel = require("../../models/categories.models")

exports.getAllCategories = async (request, response) => {
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

        const data = await categoriesModel.findAllCategories(request.query.page, 
            request.query.limit, 
            request.query.search,
            request.query.sort,
            request.query.sortBy)
        return response.json({
            success: true,
            message: "List off all categories",
            results: data
        })
  
    } 
    catch (error) {
        console.log(error)
        return errorHandler(response, error)
  
    }
}


exports.getOneCategories = async (request, response) => {
    try {
        if(isNaN(request.params.id) && parseInt(request.params.id) !== request.params.id){
            return response.status(400).json({
                success:false,
                message: "Parameter id must be number!"
            })
        }
        const data = await categoriesModel.findOne(request.params.id)
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

exports.createCategories = async (request, response) => {
    console.log(request)
    try{
        if(!request.body.name){
            return response.status(404).json({
                success: false,
                message: "Data cannot be empty!",
                results: ""
            })
        }
        const categories = await categoriesModel.insert(request.body)
        return response.json({
            success: true,
            message: "Creat categories success",
            results: categories
        })
    }catch(err){
        return errorHandler(response, err) 
    }
}

exports.updateCategories = async (request, response) => {
    try{
        if(!request.params.id || isNaN(request.params.id)){
            throw Error("id_empty")
        }
        const resultUpdate = await categoriesModel.update(request.params.id, request.body)
        if(resultUpdate){
            return response.json({
                success: true,
                message: "Update user sucessfully",
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


exports.deleteCategories = async (request, response) => {
    try{
        const resultCategories = await categoriesModel.findOne(request.params.id)
        if(!resultCategories){
            return response.status(404).json({
                success: false,
                message: "Error : Data users not found",
                results: ""
            })
        }
        await categoriesModel.destroy(request.params.id)
        return response.json({
            success: true,
            message: "Delete user sucessfully",
            results : ""
        })
    }
    catch(err){
        return errorHandler(response, err)
    }
}
