const errorHandler = (response, err) => {
    console.log(err)
    if(err?.message?.includes("duplicate key")){
        // console.log(err)
        return response.status(409).json({
            success: false,
            message:"Error: Email already used!",
        })
    }
    if(err === undefined){
        console.log(err)
        return response.status(404).json({
            success: false,
            message: "Error: User not found!",
        })
    }
    if(err?.message?.includes("name_empty_field")){
        return response.status(400).json({
            success: false,
            message: "Error : Name cannot be empty!",
        })
    }
    if(err?.message?.includes("empty_field")){
        return response.status(400).json({
            success: false,
            message: "Error : Email or password cannot be empty!",
        })
    }
    console.log(err)
    return response.status(500).json({
        success: false,
        message:"Error: Internal server error!",
    })
}

module.exports = errorHandler
