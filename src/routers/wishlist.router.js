const wishlistRouter = require("express").Router()

const wishlistControllers = require("../controllers/wishlist.controller" )

wishlistRouter.get("/", wishlistControllers.getWishlist)

module.exports = wishlistRouter
