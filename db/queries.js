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
                    WHERE name ILIKE $1)`;
  const { rows } = await pool.query(SQL, [pantheon]);
  return rows;
}

async function getGod(id) {
  const SQL = `SELECT g.*, p.name AS pantheon FROM gods AS g
                INNER JOIN pantheons AS p 
                  ON g.pantheon_id = p.id
                    WHERE g.id = $1`;
  const { rows } = await pool.query(SQL, [id]);
  return rows;
}

async function getGodSymbols(god_id) {
  const SQL = `SELECT symbols.symbol, symbols.id FROM symbols
                INNER JOIN god_symbols
                  ON symbols.id = god_symbols.symbol_id
                    INNER JOIN gods
                      ON god_symbols.god_id = gods.id
                       WHERE gods.id = $1`;
  const { rows } = await pool.query(SQL, [god_id]);
  return rows;
}

async function getGodDomains(god_id) {
  const SQL = `SELECT domains.name FROM domains
                INNER JOIN god_domains
                  ON domains.id = god_domains.domain_id
                    INNER JOIN gods
                      ON god_domains.god_id = gods.id
                        WHERE gods.id = $1`;
  const { rows } = await pool.query(SQL, [god_id]);
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

async function deleteGod(id) {
  const SQL = `DELETE FROM gods WHERE id = $1`;
  return await pool.query(SQL, [id]);
}

async function deletePantheon(name) {
  const SQL = `DELETE FROM pantheons WHERE name = $1`;
  return await pool.query(SQL, [name]);
}

module.exports = {
  getPantheons,
  getGods,
  getGodSymbols,
  getGodDomains,
  createPantheon,
  getGod,
  createGod,
  deleteGod,
  deletePantheon,
};
