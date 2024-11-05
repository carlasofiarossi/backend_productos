/// RUTAS DEL MODULO ///
const express = require("express");
const router = express.Router();

//// MULTER ///
const multer = require("multer");
const path = require("path");

const storage = multer.diskStorage({
    destination:(req, file, cb) => {
        cb(null, 'uploads'); // carpeta de destino para las imágenes cargadas
    },
    filename: (req, file, cb) => {
        console.log(file);
        cb(null, Date.now() + path.extname(file.originalname)); //nombre único para cada archivo, son los segundos desde 1970
    },
});

const upload = multer({storage});


//// AUTH ////
const controller = require("../controllers/auth.controller");
const authMiddleware = require("../middleware/auth.middleware")

//// METODO POST  ////
router.post('/register', upload.single('imagen'), controller.register);
router.post('/login', controller.login);

router.get("/protected", authMiddleware, (req, res) => {
    res.status(200).send(`Hola Usuario ${req.userId}`);
});



// EXPORTAR ROUTERS
module.exports = router;

