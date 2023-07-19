const db = require ("../helpers/db.helper")

exports.findAllCitites = async function(page, search, sort, sortBy){
    page = parseInt(page) || 1
    search = search || ""
    sort = sort || "id"
    sortBy = sortBy || "ASC"

    const query = `
  SELECT * FROM "citites" WHERE "name" LIKE $1 ORDER BY "${sort}" ${sortBy}
  `
    const values = [`%${search}%`]
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
    console.log(data, "data model")
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
