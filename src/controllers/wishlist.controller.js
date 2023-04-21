const errorHandler = require("../../src/helpers/erorHandler.helper")
const wishlistModels = require("../../src/models/wishlist.models")


exports.getWishlist = async (req, res) => {
    try{
        const {id} = req.user
        const wishlist  = await wishlistModels.findOneByUserId(id)
        if(!wishlist){
            throw Error("wishlist_not_found!")
        }
        return res.json({
            success: true,
            message: "Wishlist",
            results: wishlist
        })
    }catch(err){
        return errorHandler(res, err)
    }
}
