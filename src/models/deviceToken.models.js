const db = require("../helpers/db.helper")

const tabel = "deviceToken"

exports.findAll = async function(page, limit, sort, sortBy){
    page = parseInt(page) || 1
    limit = parseInt(limit) || 5
    sort = sort || "id"
    sortBy = sortBy || "ASC"

    const offset = (page - 1) * limit

    const query = `
  SELECT * FROM "${tabel}"
  ORDER BY "${sort}" ${sortBy} 
  LIMIT $1  OFFSET $2 
  `
    const values = [limit, offset]
    const {rows} = await db.query(query, values)
    return rows
}

exports.insertToken = async function(id,data){
    const query = `
INSERT INTO "${tabel}" 
("token", "userId")
VALUES ($1, $2) RETURNING *
`
    const values = [data.token, id]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.findOneByToken = async (token)=>{
    const query = `
SELECT * FROM "${tabel}" 
WHERE token = $1
`
    const values = [token]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.updateUserIdByToken = async (token, id)=>{
    const query = `
UPDATE"${tabel}" 
SET  "userId" = $2
WHERE token = $1
`
    const values = [token, id]
    const {rows} = await db.query(query, values)
    return rows [0]
}

