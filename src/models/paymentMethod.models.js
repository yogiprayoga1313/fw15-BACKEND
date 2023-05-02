const db = require ("../helpers/db.helper")

exports.findAllPaymentMethod = async function(page, limit, search, sort, sortBy){
    page = parseInt(page) || 1
    limit = parseInt(limit) || 5
    search = search || ""
    sort = sort || "id"
    sortBy = sortBy || "ASC"

    const offset = (page - 1) * limit

    const query = `
  SELECT * FROM "paymentMethod" WHERE "name" LIKE $3 ORDER BY "${sort}" ${sortBy} LIMIT $1  OFFSET $2 
  `
    const values = [limit, offset,`%${search}%`]
    const {rows} = await db.query(query, values)
    return rows
}

exports.findOne = async function(id){
    const query = `
SELECT  * FROM "paymentMethod" WHERE id=$1
`
    const values = [id]
    const {rows} = await db.query(query, values)
    return rows[0]
}

exports.insert = async function(data){
    const query = `
INSERT INTO "paymentMethod" ("name") 
VALUES ($1) RETURNING *
`
    const values = [data.name]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.update = async function(id, data){
    const query = `
UPDATE "paymentMethod" 
SET "name"=$2
WHERE "id"=$1
RETURNING *
`
    const values = [id, data.name]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.updatePaymentStatus = async function(data){
    const query = `
UPDATE "reservations" 
SET "statusId"=$2, "paymentMethodId"=$3
WHERE "id"=$1 AND "userId" = $4
RETURNING *
`
    const values = [data.reservationId, data.statusId, data.paymentMethodId, data.userId]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.destroy = async function(id){
    const query = `
DELETE FROM "paymentMethod" WHERE "id"=$1
`
    const values = [id]
    const {rows} = await db.query(query, values)
    return rows [0]
}
