const db = require ("../helpers/db.helper")

exports.findAllReservationsTickets = async function(page, limit, search, sort, sortBy){
    page = parseInt(page) || 1
    limit = parseInt(limit) || 5
    search = search || ""
    sort = sort || "id"
    sortBy = sortBy || "ASC"

    const offset = (page - 1) * limit

    const query = `
  SELECT * FROM "reservationsTickets" WHERE CAST("reservationId" AS VARCHAR) LIKE $3 ORDER BY "${sort}" ${sortBy} LIMIT $1  OFFSET $2 
  `
    const values = [limit, offset,`%${search}%`]
    const {rows} = await db.query(query, values)
    return rows
}

exports.findOne = async function(id){
    const query = `
SELECT  * FROM "reservationsTickets" WHERE id=$1
`
    const values = [id]
    const {rows} = await db.query(query, values)
    return rows[0]
}

exports.insert = async function(data){
    const query = `
INSERT INTO "reservationsTickets" ("reservationId", "sectionId", "quantity") 
VALUES ($1, $2, $3) RETURNING *
`
    const values = [data.reservationId, data.sectionId, data.quantity]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.update = async function(id, data){
    const query = `
UPDATE "reservationsTickets" 
SET "reservationId"=$2, "sectionId"=$3, "quantity"=$4
WHERE "id"=$1
RETURNING *
`
    const values = [id, data.reservationId, data.sectionId, data.quantity]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.destroy = async function(id){
    const query = `
DELETE FROM "reservationsTickets" WHERE "id"=$1
`
    const values = [id]
    const {rows} = await db.query(query, values)
    return rows [0]
}
