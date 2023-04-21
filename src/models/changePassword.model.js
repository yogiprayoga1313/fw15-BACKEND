const db = require ("../helpers/db.helper")

exports.findAll = async function(page, limit, search, sort, sortBy){
    page = parseInt(page) || 1
    limit = parseInt(limit) || 5
    search = search || ""
    sort = sort || "id"
    sortBy = sortBy || "ASC"

    const offset = (page - 1) * limit

    const query = `
    SELECT * FROM "changePassword" WHERE "email" LIKE $3 ORDER BY "${sort}" ${sortBy} LIMIT $1  OFFSET $2 
    `
    const values = [limit, offset,`%${search}%`]
    const {rows} = await db.query(query, values)
    return rows
}

exports.findOne = async function(id){
    const query = `
  SELECT  * FROM "changePassword" WHERE "id"=$1
  `
    const values = [id]
    const {rows} = await db.query(query, values)
    return rows[0]
}


exports.findOneByEmail = async function(email){
    const query = `
SELECT  * FROM "changePassword" WHERE "email"=$1
`
    const values = [email]
    const {rows} = await db.query(query, values)
    return rows[0]
}

exports.findOneByCode = async function(code){
    const query = `
SELECT  * FROM "changePassword" WHERE "code"=$1
`
    const values = [code]
    const {rows} = await db.query(query, values)
    return rows[0]
}

exports.findOneByCodeAndEmail = async function(code, email){
    const query = `
SELECT  * FROM "changePassword" WHERE "code"=$1 AND "email"=$2
`
    const values = [code, email]
    const {rows} = await db.query(query, values)
    return rows[0]
}

exports.insert = async function(data){
    // console.log(data)
    const query = `
  INSERT INTO "changePassword" ("email", "code")
  VALUES ($1, $2) RETURNING *
  `
    const values = [data.email, data.code]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.update = async function(id, data){
    // console.log(data.picture, "data ini dimana?")
    const query = `
  UPDATE "changePassword" 
  SET "email"=$2, "code"=$3
  WHERE "id"=$1
  RETURNING *
`
    const values = [id, data.email, data.code]
    const {rows} = await db.query(query, values)
    return rows [0]
}

exports.updatePassword = async function(id, password){
    // console.log(data.picture, "data ini dimana?")
    const query = `
UPDATE "users" 
SET "password"=$2
WHERE "id"=$1
RETURNING *
`
    const values = [id, password]
    const {rows} = await db.query(query, values)
    return rows [0]
}


exports.destroy = async function(id){
    const query = `
  DELETE FROM "changePassword" WHERE "id"=$1
`
    const values = [id]
    const {rows} = await db.query(query, values)
    return rows [0]
}
