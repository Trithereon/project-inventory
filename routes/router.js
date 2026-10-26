const { Router } = require("express");
const router = Router();
const controller = require("../controllers/controller");

// GET
router.get("/", controller.indexGet);
router.get("/pantheon/:id/:name", controller.pantheonGet);
router.get("/god/:id/:name", controller.godGet);

// POST
router.post("/pantheon/create", controller.pantheonPost);
router.post("/god/create", controller.godPost);

// DELETE
router.delete("/god/delete/:id", controller.godDelete);
router.delete("/pantheon/delete/:id", controller.pantheonDelete);

// PUT
router.put("/pantheon/edit/:id", controller.pantheonPut);
router.put("/god/edit/:id", controller.godPut);

router.all("{*splat}", (req, res) => {
  console.log("404 triggered by:", req.method, req.originalUrl);
  res.status(404).render("404");
});

module.exports = router;
