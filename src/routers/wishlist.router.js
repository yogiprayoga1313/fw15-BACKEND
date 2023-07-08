const wishlistRouter = require("express").Router()

const wishlistControllers = require("../controllers/wishlist.controller" )

wishlistRouter.get("/", wishlistControllers.getWishlist)
wishlistRouter.post("/", wishlistControllers.createWishlist)
wishlistRouter.delete("/:id", wishlistControllers.deleteWishlist)

module.exports = wishlistRouter
