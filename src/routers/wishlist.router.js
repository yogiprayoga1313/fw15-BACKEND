const wishlistRouter = require("express").Router()

const wishlistControllers = require("../controllers/wishlist.controller" )

wishlistRouter.get("/", wishlistControllers.getWishlist)
wishlistRouter.post("/", wishlistControllers.createWishlist)

module.exports = wishlistRouter
