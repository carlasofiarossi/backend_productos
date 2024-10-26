/// CONTROLADORES DEL MODULO ///

// Campos de la tabla marcas
// id_marca
// nombre
// fk_pais


const db = require("../db/db");

//// METODO GET  /////

// Para todos las marca
const allBrand = (req, res) => {
    const sql = "SELECT * FROM marcas";
    db.query(sql, (error, rows) => {
        if(error){
            return res.status(500).json({error : "ERROR: Intente mas tarde por favor"});
        }
        res.json(rows);
    }); 
};

// Para una marca
const showBrand = (req, res) => {
    const {id_marca} = req.params;
    const sql = "SELECT * FROM marcas WHERE id_marca = ?";
    db.query(sql,[id_marca], (error, rows) => {
        console.log(rows);
        if(error){
            return res.status(500).json({error : "ERROR: Intente mas tarde, por favor."});
        }
        if(rows.length == 0){
            return res.status(404).send({error : "ERROR: La marca buscada no existe."});
        };
        res.json(rows[0]); 
        // me muestra el elemento en la posicion cero si existe.
    }); 
};

//// METODO POST  ////
const storeBrand = (req, res) => {
    const {nombre, fk_pais} = req.body;
    const sql = "INSERT INTO marcas (nombre, fk_pais) VALUES (?,?)";
    db.query(sql,[nombre, fk_pais], (error, result) => {
        console.log(result);
        if(error){
            return res.status(500).json({error : "ERROR: Intente mas tarde, por favor"});
        }
        const marca = {...req.body, id: result.insertId}; // ... reconstruir el objeto del body
        res.status(201).json(marca); // muestra creado con exito el elemento
    });     

};

//// METODO PUT  ////
const updateBrand = (req, res) => {
    const {id_marca} = req.params;
    const {nombre, fk_pais} = req.body;
    const sql ="UPDATE marcas SET nombre = ?, fk_pais =? WHERE id_marca = ?";
    db.query(sql,[nombre, fk_pais, id_marca], (error, result) => {
        console.log(result);
        if(error){
            return res.status(500).json({error : "ERROR: Intente mas tarde, por favor."});
        }
        if(result.affectedRows == 0){
            return res.status(404).send({error : "ERROR: La marca a modificar no existe."});
        };
        
        const marca = {...req.body, ...req.params}; // ... reconstruir el objeto del body

        res.json(marca); // mostrar el elemento que existe
    });     
};


//// METODO DELETE ////
const destroyBrand = (req, res) => {
    const {id_marca} = req.params;
    const sql = "DELETE FROM marcas WHERE id_marca = ?";
    db.query(sql,[id_marca], (error, result) => {
        console.log(result);
        if(error){
            return res.status(500).json({error : "ERROR: Intente mas tarde por favor"});
        }
        if(result.affectedRows == 0){
            return res.status(404).send({error : "ERROR: La marca a borrar no existe"});
        };
        res.json({mesaje : "Marca eliminada con exito."});
    }); 
};


// EXPORTAR DEL MODULO TODAS LAS FUNCIONES
module.exports = {
    allBrand,
    showBrand,
    storeBrand,
    updateBrand,
    destroyBrand
};
