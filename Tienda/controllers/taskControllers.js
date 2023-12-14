/**
 * Código para controlar las tareas relacionadas con la base de datos.
 */

const conector = require('../bd/mysql');
const instanciaControlador = {};

// Obtiene todas las tareas de una tabla específica.
instanciaControlador.getAllTasks = (req, res) => {
    const tabla = req.params.tabla;
    const sql = `SELECT * FROM ${tabla}`;

    conector.query(sql, (error, resultado) => {
        if (error)
            throw error;

        if (resultado.length > 0) {
            res.setHeader("Content-Type", "application/json");
            res.send(JSON.stringify({ respuesta: resultado }));
        } else {
            res.status(404);
            res.setHeader("Content-Type", "application/json");
            res.send(JSON.stringify({ respuesta: "Posición no encontrada" }));
        }

    });
}

// Obtiene una tarea específica de una tabla.
instanciaControlador.getTasks = (req, res) => {
    const id = req.params.id;
    const tabla = req.params.tabla;
    const sql = `SELECT * FROM ?? WHERE id = ?`;


    conector.query(sql, [tabla, id], (error, resultado) => {
        if (error)
            throw error;

        if (resultado.length > 0) {
            res.setHeader("Content-Type", "application/json");
            res.send(JSON.stringify({ respuesta: resultado }));
        } else {
            res.status(404);
            res.setHeader("Content-Type", "application/json");
            res.send(JSON.stringify({ respuesta: "Posición no encontrada" }));
        }

    });
}

// Obtiene todas las tareas relacionadas con fabricantes y productos.
instanciaControlador.getEverythingTasks = (req, res) => {

    const sql = `SELECT fabricante.id, fabricante.nombre AS FABRICANTE, producto.id, producto.nombre, producto.precio, producto.id_fabricante
    FROM fabricante
    INNER JOIN producto
    ON fabricante.id = producto.id_fabricante;`;

    conector.query(sql, (error, resultado) => {
        if (error)
            throw error;

        if (resultado.length > 0) {
            res.setHeader("Content-Type", "application/json");
            res.send(JSON.stringify({ respuesta: resultado }));
        } else {
            res.status(404);
            res.setHeader("Content-Type", "application/json");
            res.send(JSON.stringify({ respuesta: "Posición no encontrada" }));
        }

    });

}

// Obtiene todos los productos relacionados con un fabricante específico.
instanciaControlador.getEverythingProducts = (req, res) => {
    const fabricante = req.params.fabricante;
    const sql = `SELECT UPPER(fabricante.nombre) AS NOMBRE_FABRICANTE, producto.id AS ID_DEL_PRODUCTO, producto.nombre AS NOMBRE, producto.precio AS PRECIO_€, ROUND(producto.precio * 1.2) AS PRECIO_$
    FROM fabricante
    INNER JOIN producto
    ON producto.id_fabricante = fabricante.id WHERE fabricante.nombre = ? ORDER BY producto.precio ASC;`;

    conector.query(sql,[fabricante], (error, resultado) => {
        if (error)
            throw error;

        if (resultado.length > 0) {
            res.setHeader("Content-Type", "application/json");
            res.send(JSON.stringify({ respuesta: resultado }));
        } else {
            res.status(404);
            res.setHeader("Content-Type", "application/json");
            res.send(JSON.stringify({ respuesta: "Posición no encontrada" }));
        }

    });

}

// Crea una nueva tarea en la tabla especificada.
instanciaControlador.createTasks = (req, res) => {

    const tabla = req.params.tabla;

    if (tabla === "fabricante") {
        const sql = `INSERT INTO fabricante (id, nombre) VALUES (?, ?);`;
        const { id, nombre } = req.body;

        conector.query(sql, [id, nombre], (error, resultado) => {
            if (error)
                throw error;
            res.send(JSON.stringify({ respuesta: "Inserción realizada con Éxito" }));
        });

    }

    if (tabla === "producto") {
        const sql = `INSERT INTO producto (id, nombre, precio, id_fabricante) VALUES (?, ?, ?, ?);`;
        const { id, nombre, precio, id_fabricante } = req.body;

        conector.query(sql, [id, nombre, precio, id_fabricante], (error, resultado) => {
            if (error)
                throw error;
            res.send(JSON.stringify({ respuesta: "Inserción realizada con Éxito" }));
        });
    }
}

// Actualiza una tarea en la tabla especificada.
instanciaControlador.updateTasks = (req, res) => {

    const tabla = req.params.tabla;

    if (tabla === "fabricante") {
        const sql = `UPDATE fabricante SET id = ?, nombre = ? WHERE id = ?;`;
        const { id_fabricante, nombre} = req.body;
        const id = req.params.id;

        conector.query(sql, [id_fabricante, nombre, id], (error, resultado) => {
            if (error)
                throw error;
            res.send(JSON.stringify({ respuesta: "Inserción realizada con Éxito" }));
        });

    }

    if (tabla === "producto") {

        const sql = `UPDATE producto SET id = ?, nombre = ?, precio = ?, id_fabricante = ?  WHERE id = ?;`;
        const { id_producto, nombre, precio, id_fabricante } = req.body;
        const id = req.params.id;

        conector.query(sql, [id_producto, nombre, precio, id_fabricante, id], (error, resultado) => {
            if (error)
                throw error;
            res.send(JSON.stringify({ respuesta: "Inserción realizada con Éxito" }));
        });
    }
}

// Elimina una tarea de la tabla especificada.
instanciaControlador.deleteTasks = (req, res) => {
    const tabla = req.params.tabla;
    const id = req.params.id;
    const sql = `DELETE FROM ?? WHERE id = ?`;


    conector.query(sql, [tabla, id], (err, result) => {
        if (err) throw err;
        res.setHeader("Content-Type", "application/json")
        res.send(JSON.stringify({ respuesta: "Eliminación realizada con Exito" }));
    });
}



module.exports = instanciaControlador;