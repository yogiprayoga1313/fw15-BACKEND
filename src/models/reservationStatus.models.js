const db = require ("../helpers/db.helper")

exports.findAllReservationStatus = async function(page, limit, search, sort, sortBy){
    page = parseInt(page) || 1
    limit = parseInt(limit) || 5
    search = search || ""
    sort = sort || "id"
    sortBy = sortBy || "ASC"

    const offset = (page - 1) * limit

    const query = `
  SELECT * FROM "reservationStatus" WHERE "name" LIKE $3 ORDER BY "${sort}" ${sortBy} LIMIT $1  OFFSET $2 
  `
    const values = [limit, offset,`%${search}%`]
    const {rows} = await db.query(query, values)
    return rows
}

exports.findOne = async function(id){
    const query = `
SELECT  * FROM "reservationStatus" WHERE id=$1
`
    const values = [id]
    const {rows} = await db.query(query, values)
    return rows[0]
}

exports.insert = async function(data){
    const query = `
INSERT INTO "reservationStatus" ("name") 
VALUES ($1) RETURNING *
`
    const values = [data.name]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.update = async function(id, data){
    const query = `
UPDATE "reservationStatus" 
SET "name"=$2
WHERE "id"=$1
RETURNING *
`
    const values = [id, data.name]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.destroy = async function(id){
    const query = `
DELETE FROM "reservationStatus" WHERE "id"=$1
`
    const values = [id]
    const {rows} = await db.query(query, values)
    return rows [0]
}
