/// CONTROLADORES DEL MODULO ///

// Campos de la tabla articulos
// id_producto
// nombre
// fk_categoria
// fk_subcategoria
// fk_tipo
// fk_marca
// descripcion
// precio

const db = require("../db/db");

//// METODO GET  /////

// Para todos las articulos
const allArticle = (req, res) => {
    const sql = "SELECT * FROM articulos";
    db.query(sql, (error, rows) => {
        if(error){
            return res.status(500).json({error : "ERROR: Intente mas tarde, por favor."}); //si ocurre un error al ejecutar la consulta en la base de datos se envía una
        }                                                                                //respuesta en formato JSON al cliente indicando que hubo un fallo en el servidor.
        res.json(rows);
    }); 
};

// Para un articulo
const showArticle = (req, res) => {
    const {id_articulo} = req.params;
    const sql = "SELECT * FROM articulos WHERE id_articulo = ?";
    db.query(sql,[id_articulo], (error, rows) => {
        console.log(rows);
        if(error){
            return res.status(500).json({error : "ERROR: Intente mas tarde, por favor."});
        }
        if(rows.length == 0){
            return res.status(404).send({error : "ERROR: El artículo buscado no existe."});
        };
        res.json(rows[0]); 
        // me muestra el elemento en la posicion cero si existe.
    }); 
};

//// METODO POST  ////
const storeArticle = (req, res) => {
    const {nombre, fk_categoria, fk_subcategoria, fk_tipo, fk_marca, descripcion, precio} = req.body;
    const sql = "INSERT INTO articulos (nombre, fk_categoria, fk_subcategoria, fk_tipo, fk_marca, descripcion, precio) VALUES (?,?,?,?,?,?,?)";
    db.query(sql,[nombre, fk_categoria, fk_subcategoria, fk_tipo, fk_marca, descripcion, precio], (error, result) => {
        console.log(result);
        if(error){
            return res.status(500).json({error : "ERROR: Intente mas tarde, por favor."});
        }
        const articulo = {...req.body, id: result.insertId}; // ... reconstruir el objeto del body
        res.status(201).json(articulo); // muestra creado con exito el elemento
    });     

};

//// METODO PUT  ////
const updateArticle = (req, res) => {
    const {id_articulo} = req.params;
    const {nombre, fk_categoria, fk_subcategoria, fk_tipo, fk_marca, descripcion, precio} = req.body;
    const sql ="UPDATE articulos SET nombre = ?, fk_categoria = ?, fk_subcategoria =?, fk_tipo=?, fk_marca = ?, descripcion = ?, precio = ? WHERE id_articulo = ?";
    db.query(sql,[nombre, fk_categoria, fk_subcategoria, fk_tipo, fk_marca, descripcion, precio, id_articulo], (error, result) => {
        console.log(result);
        if(error){
            return res.status(500).json({error : "ERROR: Intente mas tarde, por favor."});
        }
        if(result.affectedRows == 0){
            return res.status(404).send({error : "ERROR: El artículo a modificar no existe."});
        };
        
        const articulo = {...req.body, ...req.params}; // ... reconstruir el objeto del body

        res.json(articulo); // mostrar el elemento que existe
    });     
};


//// METODO DELETE ////
const destroyArticle = (req, res) => {
    const {id_articulo} = req.params;
    const sql = "DELETE FROM articulos WHERE id_articulo = ?";
    db.query(sql,[id_articulo], (error, result) => {
        console.log(result);
        if(error){
            return res.status(500).json({error : "ERROR: Intente mas tarde, por favor."});
        }
        if(result.affectedRows == 0){
            return res.status(404).send({error : "ERROR: El articulo a borrar no existe"});
        };
        res.json({mesaje : "Articulo eliminado con exito."});
    }); 
};


// EXPORTAR DEL MODULO TODAS LAS FUNCIONES
module.exports = {
    allArticle,
    showArticle,
    storeArticle,
    updateArticle,
    destroyArticle
};
