// CONFIGURAR LO QUE SERIA UN SERVIDOR CON LAS MINIMAS PRESTACIONES PARA CORRER EXPRESS
// Que este escuchando y tengamos una ruta principal "/" en el proyecto

const express = require("express");
const app = express();

app.use(express.json());
// en el cuerpo de la peticion viene un json, lo voy a transformar en un objeto JS y de esta manera
// lo voy a poder utilizar

const articulosRouter = require('./routers/articulos.router');
app.use('/articulos', articulosRouter);
// Siempre que me refiera a articulos le coloco el prefijo

const marcasRouter = require('./routers/marcas.router');
app.use('/marcas', marcasRouter);
// Siempre que me refiera a marcas le coloco el prefijo

app.get("/", (req, res) => {
    res.send("Hola Articulos");
});
// Esta es la ruta principal del proyecto "/"

const PORT = 3000;
app.listen(PORT, ()=> console.log(`http://localhost:${PORT}`));
