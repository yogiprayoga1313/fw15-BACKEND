const db = require ("../helpers/db.helper")

exports.findAllCitites = async function(page, limit, search, sort, sortBy){
    page = parseInt(page) || 1
    limit = parseInt(limit) || 5
    search = search || ""
    sort = sort || "id"
    sortBy = sortBy || "ASC"

    const offset = (page - 1) * limit

    const query = `
  SELECT * FROM "citites" WHERE "name" LIKE $3 ORDER BY "${sort}" ${sortBy} LIMIT $1  OFFSET $2 
  `
    const values = [limit, offset,`%${search}%`]
    const {rows} = await db.query(query, values)
    return rows
}

exports.findOne = async function(id){
    const query = `
SELECT  * FROM "citites" WHERE id=$1
`
    const values = [id]
    const {rows} = await db.query(query, values)
    return rows[0]
}


exports.insert = async function(data){
    const query = `
INSERT INTO "citites" ("name", "picture") 
VALUES ($1, $2) RETURNING *
`
    const values = [data.name, data.picture]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.update = async function(id, data){
    const query = `
UPDATE "citites" 
SET "name"=$2, "picture"=$3
WHERE "id"=$1
RETURNING *
`
    const values = [id, data.name, data.picture]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.destroy = async function(id){
    const query = `
DELETE FROM "citites" WHERE "id"=$1
`
    const values = [id]
    const {rows} = await db.query(query, values)
    return rows [0]
}
