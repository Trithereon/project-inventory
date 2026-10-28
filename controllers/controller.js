const db = require("../db/queries");
const {
  param,
  body,
  validationResult,
  matchedData,
} = require("express-validator");

exports.indexGet = async (req, res, next) => {
  try {
    return res.render("index", {
      title: "Gods of Ancient Times",
      pantheons: await db.getPantheons(),
    });
  } catch (err) {
    next(err);
  }
};

const validateGetParams = [
  param("id").isInt({ min: 1 }).withMessage("Invalid id").toInt(),
  param("name")
    .trim()
    .notEmpty()
    .withMessage("Name is required")
    .isLength({ min: 1, max: 100 })
    .withMessage("Name is too long")
    .matches(/^[\p{L}\p{N} '-]+$/u), // unicode regex to allow letters and digits from all alphabets
];

exports.pantheonGet = [
  validateGetParams,
  async (req, res, next) => {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        console.log("404 triggered by invalid params: ", req.originalUrl);
        return res.status(404).render("404");
      }

      const { id, name } = req.params;
      const [pantheon] = await db.getPantheon(id, name); // returns {pantheon object}

      if (!pantheon) {
        console.log("404 triggered by:", req.method, req.originalUrl);
        return res.status(404).render("404");
      }

      return res.render("pantheon", {
        title: name + " Pantheon",
        gods: await db.getGods(id),
        pantheons: await db.getPantheons(),
      });
    } catch (err) {
      next(err);
    }
  },
];

exports.godGet = [
  validateGetParams,
  async (req, res, next) => {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        console.log("404 triggered by invalid params: ", req.originalUrl);
        return res.status(404).render("404");
      }

      const { id, name } = req.params;
      const [god] = await db.getGod(id, name);

      if (!god) {
        console.log("404 triggered by:", req.method, req.originalUrl);
        return res.status(404).render("404");
      }

      return res.render("god", {
        title: req.params.name,
        god: god,
        symbols: await db.getGodSymbols(id),
        domains: await db.getGodDomains(id),
      });
    } catch (err) {
      next(err);
    }
  },
];

exports.domainGet = [
  validateGetParams,
  async (req, res, next) => {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        console.log("404 triggered by invalid params: ", req.originalUrl);
        return res.status(404).render("404");
      }

      const { id, name } = req.params;
      const [domain] = await db.getDomain(id, name);

      if (!domain) {
        console.log("404 triggered by:", req.method, req.originalUrl);
        return res.status(404).render("404");
      }

      return res.render("domain", {
        title: "Domain: " + name,
        domain: name,
        gods: await db.getDomainGods(id, name),
      });
    } catch (err) {
      next(err);
    }
  },
];

exports.symbolGet = [
  validateGetParams,
  async (req, res, next) => {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        console.log("404 triggered by invalid params: ", req.originalUrl);
        return res.status(404).render("404");
      }

      const { id, name } = req.params;
      const [symbol] = await db.getSymbol(id, name);

      if (!symbol) {
        console.log("404 triggered by:", req.method, req.originalUrl);
        return res.status(404).render("404");
      }

      return res.render("symbol", {
        title: "Symbol: " + name,
        symbol: name,
        gods: await db.getSymbolGods(id),
      });
    } catch (err) {
      next(err);
    }
  },
];

exports.pantheonPost = async (req, res, next) => {
  // insert validation here
  // must prevent name reuse, prevent null, sanitize
  try {
    const { name, origin, description } = req.body;
    if (!name || !origin || !description)
      return res.status(400).send("Error 400 Bad Request - invalid input");
    await db.createPantheon(req.body);
    return res.redirect("/");
  } catch (err) {
    next(err);
  }
};

exports.pantheonPut = async (req, res, next) => {
  // insert validation here
  try {
    const { name, origin, description } = req.body;
    if (!name || !origin || !description)
      return res.status(400).send("Error 400 Bad Request - invalid input");
    await db.updatePantheon(req.params.id, req.body);
    return res.sendStatus(200);
  } catch (err) {
    next(err);
  }
};

exports.godPost = async (req, res, next) => {
  // insert validation here
  try {
    const { name, pantheon_id } = req.body;
    if (!name || !pantheon_id)
      return res.status(400).send("Error 400 Bad Request - invalid input");
    await db.createGod(req.body);
    return res.redirect(req.headers.referer);
  } catch (err) {
    next(err);
  }
};

exports.godPut = async (req, res, next) => {
  // insert validation here
  try {
    const { name, pantheon_id } = req.body;
    if (!name || !pantheon_id)
      return res.status(400).send("Error 400 Bad Request - invalid input");
    await db.updateGod(req.params.id, req.body);
    return res.sendStatus(200);
  } catch (err) {
    next(err);
  }
};

exports.godDelete = async (req, res, next) => {
  // consider adding confirmation or password check here
  try {
    await db.deleteGod(req.params.id);
    return res.sendStatus(204);
  } catch (err) {
    next(err);
  }
};

exports.pantheonDelete = async (req, res, next) => {
  // consider adding confirmation or password check here
  try {
    await db.deletePantheon(req.params.id);
    return res.sendStatus(204);
  } catch (err) {
    next(err);
  }
};
