// CONFIGURAR LO QUE SERIA UN SERVIDOR CON LAS MINIMAS PRESTACIONES PARA CORRER EXPRESS
// Que este escuchando y tengamos una ruta principal "/" en el proyecto

require("dotenv").config();

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

const categoriasRouter = require('./routers/categorias.router');
app.use('/categorias', categoriasRouter);

const paisesRouter = require('./routers/paises.router');
app.use('/paises', paisesRouter);

const pronombresRouter = require('./routers/pronombres.router');
app.use('/pronombres', pronombresRouter);

const provinciasRouter = require('./routers/provincias.router');
app.use('/provincias', provinciasRouter);

const subcategoriasRouter = require('./routers/subcategorias.router');
app.use('/subcategorias', subcategoriasRouter);

const tiposRouter = require('./routers/tipos.router');
app.use('/tipos', tiposRouter);

const userRouter = require('./routers/user.router');
app.use('/login', userRouter);


app.use("/auth", require("./routers/auth.router"));



app.get("/", (req, res) => {
    res.send("Hola Articulos");
});
// Esta es la ruta principal del proyecto "/"

const PORT = process.env.PORT || 3001;
app.listen(PORT, ()=> console.log(`http://localhost:${PORT}`));
