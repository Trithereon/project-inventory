const db = require("../db/queries");
const { body, validationResult, matchedData } = require("express-validator");

exports.indexGet = async (req, res) => {
  return res.render("index", {
    title: "Pantheon",
    pantheons: await db.getPantheons(),
  });
};

exports.pantheonGet = async (req, res) => {
  const pantheon = req.params.id;
  const pantheons = (await db.getPantheons()).map((pantheon) => pantheon.name);
  // Prevent arbitrary pantheon name user input. TODO: Proper validation with matchedData would be better.
  if (!pantheons.includes(pantheon)) {
    console.log("404 triggered by:", req.method, req.originalUrl);
    return res.status(404).render("404");
  }
  return res.render("pantheon", {
    title: pantheon,
    gods: await db.getGods(pantheon),
    pantheons: await db.getPantheons(),
  });
};

exports.godGet = async (req, res) => {
  // insert validation here
  const name = req.params.id;
  const [god] = await db.getGod(name);
  return res.render("god", {
    title: name,
    god: god,
  });
};

exports.pantheonPost = async (req, res) => {
  // insert validation here
  // must prevent name reuse, prevent null, sanitize
  const { name, origin, description } = req.body;
  if (!name || !origin || !description)
    return res.status(400).send("Error 400 Bad Request - invalid input");
  await db.createPantheon(req.body);
  return res.redirect("/");
};

exports.godPost = async (req, res) => {
  // insert validation here
  const { name } = req.body;
  if (!name)
    return res.status(400).send("Error 400 Bad Request - invalid input");
  await db.createGod(req.body);
  return res.redirect(req.headers.referer);
};

exports.godDelete = async (req, res) => {
  // consider adding confirmation or password check here
  await db.deleteGod(req.params.id);
  return res.sendStatus(204);
};
