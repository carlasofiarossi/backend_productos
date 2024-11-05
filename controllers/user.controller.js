
const bcrypt = require("bcryptjs");
const db = require("../db/db");

/// CONTROLADORES DEL MODULO ///

// Campos de la tabla login
// id_login(int(11))
// nombre(varchar(20))
// apellido(varchar(20))
// fk_provincia(int(10))
// fk_pronombre(int(10))
// celular(int(20))
// mail(varchar(30))
//password(varchar(20))
//imagen(varchar(255))

//// METODO GET  /////

// Para todos los USUARIOS
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

//PUT//
const updateUser = (req, res) => {
    const { id_login } = req.params;
    const { nombre, apellido, fk_provincia, fk_pronombre, celular, mail, password } = req.body;
    let imagen = "";

    if (req.file) {
        imagen = req.file.filename;
    } else if (req.body.imagen) {
        imagen = req.body.imagen;
    }

    if (!password) {
        return res.status(400).json({ error: "La contraseña es requerida" });
    }

    // Encriptar la contraseña antes de actualizar el usuario
    bcrypt.hash(password, 8, (err, hash) => {
        if (err) {
            console.error("Error al encriptar la contraseña:", err);
            return res.status(500).json({ error: "Error en la encriptación de la contraseña" });
        }

        const sql = "UPDATE login SET nombre = ?, apellido = ?, fk_provincia = ?, fk_pronombre = ?, celular = ?, mail = ?, password = ?, imagen = ? WHERE id_login = ?";
        db.query(sql, [nombre, apellido, fk_provincia, fk_pronombre, celular, mail, hash, imagen, id_login], (error, result) => {
            if (error) {
                console.error("Error al ejecutar la consulta SQL:", error);
                return res.status(500).json({ error: "ERROR: Intente más tarde por favor" });
            }
            if (result.affectedRows == 0) {
                return res.status(404).json({ error: "ERROR: El usuario a modificar no existe" });
            }

            const login = { id_login, nombre, apellido, fk_provincia, fk_pronombre, celular, mail, imagen };
            res.json(login); // mostrar el elemento actualizado
        });
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
        res.json({mensaje : "Usuario Eliminado"});
    }); 
};




// EXPORTAR DEL MODULO TODAS LAS FUNCIONES
module.exports = {
    allUsers,
    showUser,
    updateUser,
    destroyUser
};
