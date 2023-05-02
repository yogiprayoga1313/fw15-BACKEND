const errorHandler = require("../../helpers/erorHandler.helper")
const wishlistModels = require("../../models/wishlist.models")

exports.getAllWishlist = async (request, response) => {
    console.log(request.query)
    try { 
        const sortWhaitlist = ["eventId", "userId"]
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
        
        const data = await wishlistModels.findAllWishlistAdmin(request.query.page, 
            request.query.limit, 
            request.query.search,
            request.query.sort,
            request.query.sortBy,
        )
        return response.json({
            success: true,
            message: "List off all Wishlist",
            results: data
        })
  
    } 
    catch (error) {
        console.log(error)
        return errorHandler(response, error)
  
    }
}

exports.getOneWishlist = async (request, response) => {
    try {
        if(isNaN(request.params.id) && parseInt(request.params.id) !== request.params.id){
            return response.status(400).json({
                success:false,
                message: "Parameter id must be number!"
            })
        }
        const data = await wishlistModels.findOne(request.params.id)
        if(data){
            console.log(data)
            return response.json({
                success: true,
                message: "Detail Wishlist",
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

exports.createWishlist = async (request, response) => {
    try{
        if(!request.body.eventId || !request.body.userId){
            throw Error("invalid_data")
        }
        console.log(request.body)
        const data = {
            ...request.body
        }
        const wishlist = await wishlistModels.insert(data)
        return response.json({
            success: true,
            message: "Creat Wishlist success",
            results: wishlist
        })
    }catch(err){
        return errorHandler(response, err) 
    }
}

exports.updateWishlist = async (request, response) => {
    try{
        if(!request.params.id){
            return response.status(404).json({
                success:false,
                message:"Id cannot be empty!"
            })
        }
        const resultUpdate = await wishlistModels.update(request.params.id, request.body)
        if(resultUpdate){
            return response.json({
                success: true,
                message: "Update Wishlist sucessfully",
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


exports.deleteWishlist = async (request, response) => {
    try{
        const resultWishlist = await wishlistModels.findOne(request.params.id)
        if(!resultWishlist){
            return response.status(404).json({
                success: false,
                message: "Error : Data Wishlist not found",
                results: ""
            })
        }
        await wishlistModels.destroy(request.params.id)
        return response.json({
            success: true,
            message: "Delete Wishlist sucessfully",
            results : ""
        })
    }
    catch(err){
        return errorHandler(response, err)
    }
}
