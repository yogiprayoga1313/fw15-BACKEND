const db = require ("../helpers/db.helper")

exports.findAllPartners = async function(page, limit, search, sort, sortBy){
    page = parseInt(page) || 1
    limit = parseInt(limit) || 6
    search = search || ""
    sort = sort || "id"
    sortBy = sortBy || "ASC"

    const offset = (page - 1) * limit

    const query = `
  SELECT * FROM "partners" WHERE "name" LIKE $3 ORDER BY "${sort}" ${sortBy} LIMIT $1  OFFSET $2 
  `
    const values = [limit, offset,`%${search}%`]
    const {rows} = await db.query(query, values)
    return rows
}

exports.findOne = async function(id){
    const query = `
SELECT  * FROM "partners" WHERE id=$1
`
    const values = [id]
    const {rows} = await db.query(query, values)
    return rows[0]
}


exports.insert = async function(data){
    const query = `
INSERT INTO "partners" ("picture", "name") 
VALUES ($1, $2) RETURNING *
`
    const values = [data.picture, data.name]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.update = async function(id, data){
    console.log(data, "data model")
    const query = `
UPDATE "partners" 
SET "picture"=$2, "name"=$3
WHERE "id"=$1
RETURNING *
`
    const values = [id, data.picture, data.name]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.destroy = async function(id){
    const query = `
DELETE FROM "partners" WHERE "id"=$1
`
    const values = [id]
    const {rows} = await db.query(query, values)
    return rows [0]
}
