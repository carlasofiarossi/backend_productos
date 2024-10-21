/// RUTAS DEL MODULO ///
const express = require("express");
const router = express.Router();

const controller = require("../controllers/user.controller");

//// METODO GET  /////

// Para todos los productos
router.get('/', controller.allUsers);

// Para un producto
router.get('/:id_login', controller.showUser);


//// METODO PUT  ////
router.put('/:id_login', controller.updateUser);

//// METODO DELETE ////
router.delete('/:id_login', controller.destroyUser);

// EXPORTAR ROUTERS
module.exports = router;

