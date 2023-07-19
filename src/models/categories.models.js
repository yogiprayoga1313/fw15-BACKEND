const db = require("../helpers/db.helper")

exports.findAllCategories = async function (page, search, sort, sortBy) {
    page = parseInt(page) || 1
    search = search || ""
    sort = sort || "id"
    sortBy = sortBy || "ASC"

    const query = `
  SELECT * FROM "categories" WHERE "name" LIKE $1 ORDER BY "${sort}" ${sortBy} 
  `
    const values = [`%${search}%`]
    const { rows } = await db.query(query, values)
    return rows
}

exports.findOne = async function (id) {
    const query = `
SELECT  * FROM "categories" WHERE id=$1
`
    const values = [id]
    const { rows } = await db.query(query, values)
    return rows[0]
}

exports.insert = async function (data) {
    const query = `
INSERT INTO "categories" ("name") 
VALUES ($1) RETURNING *
`
    const values = [data.name]
    const { rows } = await db.query(query, values)
    return rows[0]
}

exports.update = async function (id, data) {
    const query = `
UPDATE "categories" 
SET "name"=$2
WHERE "id"=$1
RETURNING *
`
    const values = [id, data.name]
    const { rows } = await db.query(query, values)
    return rows[0]
}

exports.destroy = async function (id) {
    const query = `
DELETE FROM "categories" WHERE "id"=$1
`
    const values = [id]
    const { rows } = await db.query(query, values)
    return rows[0]
}
