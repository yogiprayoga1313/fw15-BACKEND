const sectionModel = require ("../models/reservationSection.models")

exports.getAllSection = async (request, response)=>{
    const section = await sectionModel.findAllReservationSection()
    return response.json({
        succes:true,
        message:"List off Section",
        results: section
    })
}
