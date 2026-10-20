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

async function getGod(name) {
  const SQL = `SELECT * FROM gods
                WHERE name ILIKE '${name}'`;
  const { rows } = await pool.query(SQL);
  return rows;
}

async function createPantheon(pantheon) {
  const SQL = `INSERT INTO pantheons(name, origin, description)
                VALUES($1, $2, $3)`;
  return await pool.query(SQL, [
    pantheon.name,
    pantheon.origin,
    pantheon.description,
  ]);
}

async function createGod(god) {
  const SQL = `INSERT INTO gods(pantheon_id, name,gender,description, status, img_url)
                VALUES($1, $2, $3, $4, $5, $6)`;
  return await pool.query(SQL, [
    god.pantheon_id,
    god.name,
    god.gender || null,
    god.description || null,
    god.status || null,
    god.img_url || null,
  ]);
}

async function deleteGod(name) {
  const SQL = `DELETE FROM gods WHERE name=$1`;
  return await pool.query(SQL, [name]);
}

module.exports = {
  getPantheons,
  getGods,
  createPantheon,
  getGod,
  createGod,
  deleteGod,
};
