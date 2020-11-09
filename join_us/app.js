// To allow use of express.js
let express = require('express');
let app = express();

// Homepage Route
app.get("/", function(req, res) {
    console.log(req);
    res.send("You've reached the homepage!")
});

// Adding another Route
app.get("/joke", function(req, res) {
   let joke = "what do you call a dog that can do magic tricks? A labracadabrador.";
    res.send(joke);
});

// Another Route (Should return a random number as response)
app.get("/random_num", function(req, res) {
    let num = Math.floor((Math.random() * 10) + 1);
    res.send("Your luck number is " + num);
})

app.listen(8080, function () {
    console.log("Server running on 8080!");
});
