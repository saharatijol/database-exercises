var faker = require('faker');
var mysql = require('mysql');

var connection = mysql.createConnection({
   host : 'localhost',
   user : 'root',
   database: 'join_us'
});

var q = 'SELECT CURTIME() AS time, CURDATE() AS date, NOW() AS now';

connection.query(q, function (error, results, fields) {
    if (error) throw error;
    console.log(results[0].time);
    console.log(results[0].date.toString());
    console.log(results[0].now.toString());
});

connection.end();