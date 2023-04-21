const fs = require("fs")

const fileRemover = (file) => {
    if(file){
        const filename = `upload/${file.filename}`
        fs.unlink(filename, (err)=>{
            if(err){
                throw Error(err.message)
            }
        })
    }
}

module.exports = fileRemover
