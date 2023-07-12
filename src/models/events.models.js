const db = require ("../helpers/db.helper")

exports.findAllEvents = async function(page, limit, search, sort, sortBy, location, categories){
    // console.log("masuk sini")
    page = parseInt(page) || 1
    limit = parseInt(limit) || 8
    search = search || ""
    sort = sort || "id"
    sortBy = sortBy || "ASC"
    location = location || ""
    categories = categories || ""

    const offset = (page - 1) * limit

    const query = `
    SELECT e.*, c.name AS "cityName", ca.name AS "categoriesName" FROM "events" e
    INNER JOIN citites c ON c.id = e."cityId"
    INNER JOIN categories ca ON ca.id = e."categoriesId"
     WHERE
    "title" LIKE $3
    ${location ? `AND c.name LIKE '%${location}%'` : ""}
    ${categories ? `AND ca.name LIKE '%${categories}%'` : ""}
     ORDER BY "${sort}" ${sortBy} LIMIT $1  OFFSET $2 
    `
    const values = [limit, offset,`%${search}%`]
    const {rows} = await db.query(query, values)
    return rows
}

exports.countFindAllEvents = async function(page, limit, search, sort, sortBy, location, categories){
    page = parseInt(page) || 1
    limit = parseInt(limit) || 8
    search = search || ""
    sort = sort || "id"
    sortBy = sortBy || "ASC"
    location = location || ""
    categories = categories || ""

    const query = `
  SELECT COUNT(*) AS "totalData" FROM "events" e
  INNER JOIN citites c ON c.id = e."cityId"
  INNER JOIN categories ca ON ca.id = e."categoriesId"
   WHERE
  "title" LIKE $1
  ${location ? `AND c.name LIKE '%${location}%'` : ""}
  ${categories ? `AND ca.name LIKE '%${categories}%'` : ""}
  `
    const values = [`%${search}%`]
    const {rows} = await db.query(query, values)
    return rows
}

exports.findEvents = async function(page, limit, search, sort, sortBy, location, categories,userId){
    // console.log(page, limit, search, sort, sortBy, location, categories,userId)
    page = parseInt(page) || 1
    limit = parseInt(limit) || 5
    search = search || ""
    sort = sort || "id"
    sortBy = sortBy || "ASC"
    location = location || ""
    categories = categories || ""

    const offset = (page - 1) * limit

    const query = `
SELECT e.*, c.name AS "cityName", ca.name AS "categoriesName" FROM "events" e
INNER JOIN citites c ON c.id = e."cityId"
INNER JOIN categories ca ON ca.id = e."categoriesId"
INNER JOIN users ui ON e."createdBy" = ui.id
 WHERE ui.id = $4 AND 
"title" LIKE $3
${location ? `AND c.name LIKE '%${location}%'` : ""}
${categories ? `AND ca.name LIKE '%${categories}%'` : ""}
 ORDER BY "${sort}" ${sortBy} LIMIT $1  OFFSET $2 
`
// console.log(query)
    const values = [limit, offset,`%${search}%`, userId]
    const {rows} = await db.query(query, values)
    return rows
}


exports.findOne = async function(id, location, categories){
    const query = `
    SELECT e.*, c.name AS "cityName", ca.name AS "categoriesName"
    FROM "events" e
    INNER JOIN citites c ON c.id = e."cityId"
    INNER JOIN categories ca ON ca.id = e."categoriesId"
    WHERE e.id=$1
    ${location ? `AND c.name LIKE '%${location}%'` : ""}
    ${categories ? `AND ca.name LIKE '%${categories}%'` : ""}
    `
    const values = [id]
    const {rows} = await db.query(query, values)
    return rows[0]
}


exports.findOneByUserid = async function(data){
    console.log(data)
    const query = `
SELECT  * FROM "events" WHERE id=$1 AND "createdBy"=$2
`
    const values = [data.id, data.userId]
    const {rows} = await db.query(query, values)
    return rows[0]
}


exports.insert = async function(data){
    const query = `
INSERT INTO "events" ("picture", "title", "date", "cityId", "descriptions", "createdBy", "categoriesId") 
VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *
`
    const values = [data.picture, data.title, data.date, data.cityId, data.descriptions, data.userId, data.categoriesId]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.update = async function(id, data){
    const query = `
UPDATE "events" 
SET "picture"=$2, "title"=$3, "date"=$4, "cityId"=$5, "descriptions"=$6, "categoriesId"=$7
WHERE "id"=$1 
RETURNING *
`
    const values = [id, data.picture, data.title, data.date, data.cityId, data.descriptions, data.categoriesId]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.destroy = async function(id){
    const query = `
DELETE FROM "events" WHERE "id"=$1
`
    const values = [id]
    const {rows} = await db.query(query, values)
    return rows [0]
}


exports.destroyEventByCreatedBy = async function(eventId, userId) {
    const query = `
    DELETE FROM "events" e
    USING users u
    WHERE e.id = $1 AND e."createdBy" = u.id AND u.id = $2
    RETURNING e.*
  `
    const values = [eventId, userId]
    const { rows } = await db.query(query, values)
    return rows[0]
}
