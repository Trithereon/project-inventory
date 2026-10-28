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
    .isLength({ max: 100 })
    .withMessage("Name is too long")
    .matches(/^[\p{L}\p{N} '-]+$/u) // unicode regex to allow letters and digits from all alphabets
    .withMessage("Name can only contain alphanumeric characters"),
];

exports.pantheonGet = [
  validateGetParams,
  async (req, res, next) => {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        console.log("400 triggered by invalid params: ", req.originalUrl);
        return res.sendStatus(400);
      }

      const { id, name } = matchedData(req);
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
        console.log("400 triggered by invalid params: ", req.originalUrl);
        return res.sendStatus(400);
      }

      const { id, name } = matchedData(req);
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
        console.log("400 triggered by invalid params: ", req.originalUrl);
        return res.sendStatus(400);
      }

      const { id, name } = matchedData(req);
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
        console.log("400 triggered by invalid params: ", req.originalUrl);
        return res.sendStatus(400);
      }

      const { id, name } = matchedData(req);
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

const validatePantheonBody = [
  body("name")
    .trim()
    .notEmpty()
    .withMessage("Name is required")
    .isLength({ max: 100 })
    .withMessage("Name is too long")
    .matches(/^[\p{L}\p{N} '-]+$/u)
    .withMessage("Name can only contain alphanumeric characters")
    .bail() // Aborts further validation if a failure has occurred.
    .custom(async (req) => {
      const [pantheon] = await db.getPantheonByName(req.body.name);
      if (pantheon) {
        throw new Error("Pantheon name already exists");
      }
      return true;
    }),
  body("origin")
    .trim()
    .notEmpty()
    .withMessage("Origin is required")
    .isLength({ max: 100 })
    .withMessage("Origin max length 100 characters"),
  body("description")
    .trim()
    .notEmpty()
    .withMessage("Description is required")
    .isLength({ max: 500 })
    .withMessage("Description max length is 500 characters"),
];

exports.pantheonPost = [
  validatePantheonBody,
  async (req, res, next) => {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        console.log(
          "400 triggered by invalid body: ",
          req.method,
          req.originalUrl,
        );
        return res.status(400).send("Error 400 Bad Request - invalid input");
      }

      const data = matchedData(req, { includeOptionals: true });
      await db.createPantheon(data);
      return res.redirect("/");
    } catch (err) {
      next(err);
    }
  },
];

exports.pantheonPut = [
  validatePantheonBody,
  async (req, res, next) => {
    // insert validation here
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        console.log(
          "400 triggered by invalid body: ",
          req.method,
          req.originalUrl,
        );
        return res.status(400).send("Error 400 Bad Request - invalid input");
      }

      const data = matchedData(req, { includeOptionals: true });
      await db.updatePantheon(req.params.id, data);
      return res.sendStatus(200);
    } catch (err) {
      next(err);
    }
  },
];

const validateGodBody = [
  body("pantheon_id")
    .isInt({ min: 1 })
    .withMessage("A pantheon must be chosen")
    .toInt(),
  body("name")
    .trim()
    .notEmpty()
    .withMessage("Name is required")
    .isLength({ max: 100 })
    .withMessage("Name is too long")
    .matches(/^[\p{L}\p{N} '-]+$/u)
    .withMessage("Name can only contain alphanumeric characters"),
  body("gender")
    .optional({ values: "falsy" })
    .trim()
    .isIn(["Male", "Female", "Both"])
    .withMessage("Gender must be one of: Male, Female, Both"),
  body("description")
    .optional({ values: "falsy" })
    .isString()
    .withMessage("Description must be text only")
    .isLength({ max: 500 })
    .withMessage("Description length is max 500 characters"),
  body("status")
    .optional({ values: "falsy" })
    .trim()
    .isIn(["Major", "Minor"])
    .withMessage("Status must be one of: Major, Minor"),
  body("img_url")
    .optional({ values: "falsy" })
    .trim()
    .isURL({
      protocols: ["https"],
      require_protocol: true,
      require_valid_protocol: true,
      require_tld: true, // "top-level domain" like .com
      disallow_auth: true, // no user:pass@host
      allow_underscores: false,
      max_allowed_length: 2048,
    })
    .withMessage("Image URL must be valid"),
];

exports.godPost = [
  validateGodBody,
  async (req, res, next) => {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return res.sendStatus(400);
      }

      const data = matchedData(req, { includeOptionals: true });
      await db.createGod(data);
      return res.redirect(req.headers.referer);
    } catch (err) {
      next(err);
    }
  },
];

exports.godPut = [
  validateGodBody,
  async (req, res, next) => {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return res.sendStatus(400);
      }

      const data = matchedData(req, { includeOptionals: true });
      await db.updateGod(req.params.id, data);
      return res.sendStatus(200);
    } catch (err) {
      next(err);
    }
  },
];

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
