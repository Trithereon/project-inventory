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
  const pantheons = (await db.getPantheons()).map((pantheon) =>
    pantheon.name.toLowerCase(),
  );
  // Prevent arbitrary pantheon name user input. There might be a better way.
  if (!pantheons.includes(pantheon)) {
    console.log("404 triggered by:", req.method, req.originalUrl);
    return res.status(404).render("404");
  }
  return res.render("pantheon", {
    title: pantheon.charAt(0).toUpperCase() + pantheon.slice(1),
    gods: await db.getGods(pantheon),
  });
};
