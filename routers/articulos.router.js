/// RUTAS DEL MODULO ///
const express = require("express");
const router = express.Router();

const controller = require("../controllers/articulos.controller");

//// METODO GET  /////

// Para todos los productos
router.get('/', controller.allArticle);

// Para un producto
router.get('/:id_articulo', controller.showArticle);

//// METODO POST  ////
router.post('/', controller.storeArticle);

//// METODO PUT  ////
router.put('/:id_articulo', controller.updateArticle);

//// METODO DELETE ////
router.delete('/:id_articulo', controller.destroyArticle);

// EXPORTAR ROUTERS
module.exports = router;

