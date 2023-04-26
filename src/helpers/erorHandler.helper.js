const errorHandler = (response, err) => {
    console.log(err)
    if(err?.message?.includes("duplicate key")){
        // console.log(err)
        return response.status(409).json({
            success: false,
            message:"Error: Email already used!",
        })
    }
    if(err?.message?.includes("jwt malformed")){
        // console.log(err)
        return response.status(401).json({
            success: false,
            message:"Error: Token invalid!",
        })
    }
    if(err?.message?.includes("invalid signature")){
        // console.log(err)
        return response.status(401).json({
            success: false,
            message:"Error: Token Signature is Invalid!",
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
    if(err?.message?.includes("wrong_credentials")){
        return response.status(401).json({
            success: false,
            message: "The data you entered is incorrect!"
        })
    }
    if(err?.message?.includes("password_unmatch")){
        return response.status(401).json({
            success: false,
            message: "Password and confirm password does not match"
        })
    }
    if(err?.message?.includes("unauthorized")){
        return response.status(401).json({
            success: false,
            message: "unauthorized"
        })
    }
    console.log(err)
    return response.status(500).json({
        success: false,
        message:"Error: Internal server error!",
    })
}

module.exports = errorHandler
