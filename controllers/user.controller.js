/// CONTROLADORES DEL MODULO ///

// Campos de la tabla login
// id_login
// nombre
//mail
//password


const db = require("../db/db");

//// METODO GET  /////

// Para todos los login
const allUsers = (req, res) => {
    const sql = "SELECT * FROM login";
    db.query(sql, (error, rows) => {
        if(error){
            return res.status(500).json({error : "ERROR: Intente mas tarde por favor"});
        }
        res.json(rows);
    }); 
};

// Para un usuario
const showUser = (req, res) => {
    const {id_login} = req.params;
    const sql = "SELECT * FROM login WHERE id_login = ?";
    db.query(sql,[id_login], (error, rows) => {
        console.log(rows);
        if(error){
            return res.status(500).json({error : "ERROR: Intente mas tarde por favor"});
        }
        if(rows.length == 0){
            return res.status(404).send({error : "ERROR: No existe el usuario buscado"});
        };
        res.json(rows[0]); 
        // me muestra el elemento en la posicion cero si existe.
    }); 
};


//// METODO PUT  ////
const updateUser = (req, res) => {
    const {id_login} = req.params;
    const {nombre, mail, password} = req.body;
    const sql ="UPDATE login SET nombre = ?, mail = ?, password = ? WHERE id_login = ?";
    db.query(sql,[nombre, mail, password, id_login], (error, result) => {
        console.log(result);
        if(error){
            return res.status(500).json({error : "ERROR: Intente mas tarde por favor"});
        }
        if(result.affectedRows == 0){
            return res.status(404).send({error : "ERROR: El usuario a modificar no existe"});
        };
        
        const login = {...req.body, ...req.params}; // ... reconstruir el objeto del body

        res.json(login); // mostrar el elemento que existe
    });     
};


//// METODO DELETE ////
const destroyUser = (req, res) => {
    const {id_login} = req.params;
    const sql = "DELETE FROM login WHERE id_login = ?";
    db.query(sql,[id_login], (error, result) => {
        console.log(result);
        if(error){
            return res.status(500).json({error : "ERROR: Intente mas tarde por favor"});
        }
        if(result.affectedRows == 0){
            return res.status(404).send({error : "ERROR: El usuario a borrar no existe"});
        };
        res.json({mesaje : "Usuario Eliminado"});
    }); 
};




// EXPORTAR DEL MODULO TODAS LAS FUNCIONES
module.exports = {
    allUsers,
    showUser,
    updateUser,
    destroyUser
};
