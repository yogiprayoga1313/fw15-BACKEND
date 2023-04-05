// const { response } = require("express")

exports.getAllUsers = (request, response) => {
    const data = [
        {
            name: "Bob",
            phone: "0835763636272"
        }
    ]
    return response.json({
        success: true,
        message: "List off all user",
        results: data,
    })
}

exports.creatUsers = (request, response) =>{
    return response.json({
        success: true,
        message:`Creat users ${request.body.fullName} successfully`
    })
}

exports.updateUser = (request, response) => {
    return response.json({
        success: true,
        message: `Update user ${request.params.id} sucessfully`
    })
}

exports.deleteUser = (request, response) => {
    return response.json({
        success: true,
        message: `Delete user ${request.params.id} sucessfully`
    })
}
