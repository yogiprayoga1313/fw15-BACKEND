const db = require ("../helpers/db.helper")

exports.findAllReservations = async function(page, limit, search, sort, sortBy){
    page = parseInt(page) || 1
    limit = parseInt(limit) || 5
    search = search || ""
    sort = sort || "id"
    sortBy = sortBy || "ASC"

    const offset = (page - 1) * limit

    const query = `
  SELECT * FROM "reservations" WHERE CAST("eventId" AS VARCHAR) LIKE $3 ORDER BY "${sort}" ${sortBy} LIMIT $1  OFFSET $2 
  `
    const values = [limit, offset,`%${search}%`]
    const {rows} = await db.query(query, values)
    return rows
}

exports.findOne = async function(id){
    const query = `
SELECT  * FROM "reservations" WHERE id=$1
`
    const values = [id]
    const {rows} = await db.query(query, values)
    return rows[0]
}

exports.insert = async function(data){
    const query = `
INSERT INTO "reservations" ("eventId", "userId", "statusId", "paymentMethodId") 
VALUES ($1, $2, $3, $4) RETURNING *
`
    const values = [data.eventId, data.userId, data.statusId, data.paymentMethodId]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.update = async function(id, data){
    const query = `
UPDATE "reservations" 
SET 
"eventId"=COALESCE(NULLIF($2::INTEGER, NULL), "eventId"), 
"userId"=COALESCE(NULLIF($3::INTEGER, NULL), "userId"),
"statusId"=COALESCE(NULLIF($4::INTEGER, NULL), "statusId"),
"paymentMethodId"=COALESCE(NULLIF($5::INTEGER, NULL), "paymentMethodId")
WHERE "id"=$1
RETURNING *
`
    const values = [id, data.eventId, data.userId, data.statusId, data.paymentMethodId]
    const {rows} = await db.query(query, values)
    return rows [0]
}


exports.destroy = async function(id){
    const query = `
DELETE FROM "reservations" WHERE "id"=$1
`
    const values = [id]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.findHistoryByUserId = async(id,page, limit, search, sort, sortBy) => {
    page = parseInt(page) || 1
    limit = parseInt(limit) || 5
    search = search || ""
    sort = sort || "id"
    sortBy = sortBy || "ASC"

    const offset = (page - 1) * limit
    const queries = `
  SELECT
  reservations."id", 
  events.title, 
  citites."name" AS "location", 
  events."date"
FROM
  reservations
  LEFT JOIN
  events
  ON 
    reservations."eventId" = events."id"
  LEFT JOIN
  citites
  ON 
    events."cityId" = citites."id"
  WHERE reservations."userId" = $1
  AND events.title ILIKE $4
    ORDER BY ${sort} ${sortBy}
    LIMIT $2 OFFSET $3
  `  
    const values = [id,limit, offset,`%${search}%`]
    const {rows} = await db.query(queries,values)  
    return rows
}

exports.findHistoryByIdAndUserId = async(id, userId) => {
    const queries = `
  SELECT
  "e"."title",
  "c"."name",
  "e"."date",
  "rstat"."name" AS "reservationStatus",
  "pm"."name" AS "paymentStatus"
  FROM "reservations" "r"
  INNER JOIN "events" "e" ON "e"."id" = "r"."eventId"
  INNER JOIN "citites" "c" ON "c"."id" = "e"."cityId"
  INNER JOIN "reservationStatus" "rstat" ON "rstat"."id" = "r"."statusId"
  INNER JOIN "paymentMethods" "pm" ON "pm"."id" = "r"."paymentMethodId"
  WHERE "r"."id" = $1 AND "r"."userId" = $2
  `  
    const values = [id, userId]
    const {rows} = await db.query(queries,values)  
    return rows[0]
}
