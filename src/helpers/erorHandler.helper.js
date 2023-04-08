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
    return response.status(500).json({
        success: false,
        message:"Error: Internal server error!",
    })
}

module.exports = errorHandler
