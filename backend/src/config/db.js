import pkg from 'pg'
const { Pool } = pkg
import dotenv from 'dotenv'
dotenv.config()

const pool = new Pool({
  host: process.env.DB_HOST || 'localhost' || 'db',
  port: parseInt(process.env.DB_PORT || '5432', 10),
  user: 'user',
  password: process.env.DB_PASS || 'password',
  database: 'mydb'
})

export default pool
