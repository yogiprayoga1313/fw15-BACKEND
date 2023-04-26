const db = require ("../helpers/db.helper")

exports.findAllWishlist = async function(page, limit, search, sort, sortBy, userId){
    page = parseInt(page) || 1
    limit = parseInt(limit) || 5
    search = search || ""
    sort = sort || "id"
    sortBy = sortBy || "ASC"

    const offset = (page - 1) * limit

    const query = `
  SELECT * FROM "wishlist" WHERE "userId" = $4 AND CAST("eventId" AS VARCHAR) LIKE $3 ORDER BY "${sort}" ${sortBy} LIMIT $1  OFFSET $2 
  `
    const values = [limit, offset,`%${search}%`, userId]
    const {rows} = await db.query(query, values)
    return rows
}

exports.findOne = async function(id){
    const query = `
SELECT  * FROM "wishlist" WHERE id=$1
`
    const values = [id]
    const {rows} = await db.query(query, values)
    return rows[0]
}

exports.insert = async function(data){
    const query = `
INSERT INTO "wishlist" ("eventId", "userId") 
VALUES ($1, $2) RETURNING *
`
    const values = [data.eventId, data.userId]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.update = async function(id, data){
    const query = `
UPDATE "wishlist" 
SET "eventId"=$2, "userId"=$3
WHERE "id"=$1
RETURNING *
`
    const values = [id, data.eventId, data.userId]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.destroy = async function(id){
    const query = `
DELETE FROM "wishlist" WHERE "id"=$1
`
    const values = [id]
    const {rows} = await db.query(query, values)
    return rows [0]
}
