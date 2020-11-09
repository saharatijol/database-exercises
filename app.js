var faker = require('faker');
var mysql = require('mysql');

var connection = mysql.createConnection({
   host : 'localhost',
   user : 'root',
   // put back password when in use
   database: 'join_us'
});

// var q = 'SELECT CURTIME() AS time, CURDATE() AS date, NOW() AS now';
//
// connection.query(q, function (error, results, fields) {
//     if (error) throw error;
//     console.log(results[0].time);
//     console.log(results[0].date.toString());
//     console.log(results[0].now.toString());
// });
//
// connection.end();


// Another example: SELECTING DATA
// var q = 'SELECT * FROM users';
//
// connection.query(q, function (error, results, fields) {
//     if (error) throw error;
//     console.log(results[1].email);
// });
// connection.end();

// INSERTING DATA
// var q = 'INSERT INTO users(email) VALUES("rusty@gmail.com")';
// connection.query(q, function (error, results, fields) {
//     if (error) throw error;
//     console.log(results);
// });
// connection.end();

// INSERTING DATA PART 2
// var person = {
//                 email     : faker.internet.email(),
//                 created_at: faker.date.past()
// };
//
// var end_result = connection.query('INSERT INTO users SET ?', person, function(err, result) {
//     if (err) throw err;
//     console.log(result);
// });

// mySQL/Node Magic, passing a single person
// var person = {
//     email: faker.internet.email(),
//     created_at: faker.date.past()
// };

// var end_result = connection.query('INSERT INTO users SET ?', person, function(err, result) {
//   if (err) throw err;
//   console.log(result);
// });

// console.log(end_result.sql)
// connection.end();

// INSERTING LOTS OF DATA
// var data = [
//     ['blah@gmail.com', '2017-05-01 03:51:37'],
//     ['ugh@gmail.com', '2017-05-01 03:51:37'],
//     ['meh@gmail.com'], '2017-05-01 03:51:37']
// ];
//
// var q = 'INSERT INTO users (email, created_at) VALUES ?';
// connection.query(q, [data], function(err, result) {
//     console.log(err);
//     console.log(result);
// });

// BULK INSERTING 500 fake users
var data = [];

for (var i = 0; i < 500; i++) {
    data.push([
        faker.internet.email(),
        faker.date.past(),
    ]);
}
// test it
//console.log(data);

var q = 'INSERT INTO users (email, created_at) VALUES ?';
connection.query(q, [data], function(err, result) {
    console.log(err);
    console.log(result);
});

connection.end();

