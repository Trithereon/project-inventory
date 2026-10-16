const pool = require("./pool");

async function getPantheons() {
  const SQL = `SELECT * FROM pantheons`;
  const { rows } = await pool.query(SQL);
  return rows;
}

async function getGods(pantheon) {
  const SQL = `SELECT * FROM gods
                WHERE pantheon_id = 
                  (SELECT id FROM pantheons 
                    WHERE name ILIKE '${pantheon}')`;
  const { rows } = await pool.query(SQL);
  return rows;
}

module.exports = { getPantheons, getGods };
