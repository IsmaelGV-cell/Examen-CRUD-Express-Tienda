const mysql = require('mysql');
const conector = mysql.createConnection({
    host: 'mysql',
    user: 'root',
    password: 'password123',
    database: 'tienda'
});
module.exports = conector;