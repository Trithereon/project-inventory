const { Router } = require("express");
const router = Router();
const controller = require("../controllers/controller");

router.get("/", controller.indexGet);
router.post("/pantheon/new", controller.pantheonPost);
router.post("/god/new", controller.godPost);
router.get("/pantheon/:id/view", controller.pantheonGet);
router.get("/god/:id/view", controller.godGet);

router.all("{*splat}", (req, res) => {
  console.log("404 triggered by:", req.method, req.originalUrl);
  res.status(404).render("404");
});

module.exports = router;
