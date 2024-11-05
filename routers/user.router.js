/// RUTAS DEL MODULO ///
const express = require("express");
const router = express.Router();

const controller = require("../controllers/user.controller");

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

//// METODO GET  /////

// Para todos los productos
router.get('/', controller.allUsers);

// Para un producto
router.get('/:id_login', controller.showUser);


//// METODO PUT  ////
router.put('/:id_login', upload.single('imagen'), controller.updateUser);

//// METODO DELETE ////
router.delete('/:id_login', controller.destroyUser);

// EXPORTAR ROUTERS
module.exports = router;

