const errorHandler = require("../helpers/erorHandler.helper")
// const fileRemover = require("../helpers/fileRemover.helper")
const profileModels = require("../models/profile.model")
const userModel = require("../models/users.model")

exports.updateProfile = async (req, res) => {
    try {
        const { id } = req.user
        const user = await profileModels.findOneByUserId(id)
        const data = {
            ...req.body
        }
        if (req.file) {
            if (user.picture) {
                // fileRemover({ filename: user.picture })
            }

            data.picture = req.file.path
        }
        const profile = await profileModels.updateByUserId(id, data)
        if (!profile) {
            throw Error("Update_profile_failed")
        }
        const userUpdate = await userModel.update(id, data)
        if (!userUpdate) {
            throw Error("Update_profile_failed")
        }
        const results = {
            ...profile,
            email: userUpdate?.email,
            userName: userUpdate?.userName
        }
        console.log(results)
        return res.json({
            success: true,
            message: "Profile Updated",
            results

        })

    } catch (err) {
        return errorHandler(res, err)
    }
}

exports.getProfile = async (req, res) => {
    try {
        const { id } = req.user
        const profile = await profileModels.findOneByUserId(id)
        if (!profile) {
            throw Error("profile_not_found!")
        }
        return res.json({
            success: true,
            message: "Profile",
            results: profile
        })
    } catch (err) {
        return errorHandler(res, err)
    }
}
