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


// Another example: SELECTING DATA
var q = 'SELECT * FROM users';

connection.query(q, function (error, results, fields) {
    if (error) throw error;
    console.log(results[1].email);
});
connection.end();

// INSERTING DATA
// var q = 'INSERT INTO users(email) VALUES("rusty@gmail.com")';
// connection.query(q, function (error, results, fields) {
//     if (error) throw error;
//     console.log(results);
// });
// connection.end();

// INSERTING DATA PART 2
var person = {email: faker.internet.email()};

var end_result = connection.query('INSERT INTO users SET ?', person, function(err, result) {
    if (err) throw err;
    console.log(result);
});