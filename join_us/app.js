// To allow use of express.js
let mysql = require('mysql');
let express = require('express');
let bodyParser = require('body-parser')
let app = express();

// Configure express application
app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + "/public"));

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
       //res.send("We have " + count + " users in our db");
        res.render("home", {counter: count}); // This will look for Views directory > home.ejs
    });
    // Respond with that count
    //res.send("We have " + count + " users in our db");
});

// Adding another Route
app.get("/joke", function(req, res) {
   let joke = "<strong>what do you call a dog that can do magic tricks?</strong> A <em>labracadabrador.</em>";
    //res.send(joke);
    res.render("home");
});

// Another Route (Should return a random number as response)
app.get("/random_num", function(req, res) {
    let num = Math.floor((Math.random() * 10) + 1);
    res.send("Your luck number is " + num);
})

// Route for POST request, we needed a body-parser otherwise the response will return undefined
app.post("/register", function(req, res) {
    let person = {email: req.body.email};
    connection.query('INSERT INTO users SET ?', person, function(err, result) {
        if (err) throw err;
        //console.log(result);
        res.send("Thanks for joining our mail list!");
        // res.redirect("/");
    });
});

// This works with IntelliJ
app.listen(8080, function () {
    console.log("Server listening on port 8080!");
});

// This will work on goorm ide
// app.listen(3000, function () {
//     console.log("Server listening on port 3000!");
// });
