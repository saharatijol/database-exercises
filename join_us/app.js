// To allow use of express.js
let mysql = require('mysql');
let express = require('express');
let app = express();

// Configure express application
app.set("view engine", "ejs");

// MySQL Database connection
let connection = mysql.createConnection({
    host : 'localhost',
    user : 'root',
    // Add password when in use later
    database: 'join_us'
});

// Homepage Route
app.get("/", function(req, res) {
    // Find count of users in DB
    let q = "SELECT COUNT(*) AS count FROM users";
    connection.query(q, function(err, results) {
       if (err) throw err;
       let count = results[0].count;
       res.send("We have " + count + " users in our db");
    });
    // Respond with that count
    //res.send("We have " + count + " users in our db");
});

// Adding another Route
app.get("/joke", function(req, res) {
   let joke = "<strong>what do you call a dog that can do magic tricks?</strong> A <em>labracadabrador.</em>";
    res.send(joke);
});

// Another Route (Should return a random number as response)
app.get("/random_num", function(req, res) {
    let num = Math.floor((Math.random() * 10) + 1);
    res.send("Your luck number is " + num);
})

// This works here
app.listen(8080, function () {
    console.log("Server listening on port 8080!");
});

// This will work on goorm ide
// app.listen(3000, function () {
//     console.log("Server listening on port 3000!");
// });
