const wishlistRouters = require("express").Router()

const wishlistControllers = require("../../controllers/admin/wishlist.controllers" )

wishlistRouters.get("/", wishlistControllers.getAllWishlist)
wishlistRouters.get("/:id", wishlistControllers.getOneWishlist)
wishlistRouters.post("/", wishlistControllers.createWishlist)
wishlistRouters.patch("/:id", wishlistControllers.updateWishlist)
wishlistRouters.delete("/:id", wishlistControllers.deleteWishlist)


module.exports = wishlistRouters
