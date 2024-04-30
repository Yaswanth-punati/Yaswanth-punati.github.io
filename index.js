const express = require('express');
const mysql = require('mysql');

const app = express();
const portNumber = 8081;

app.use(express.static("public"));
app.use(express.urlencoded({ extended: false }));

app.set("view engine", "ejs");
app.set("views", "views");

// Connect with the database
const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'bus'
});

con.connect((err) => {
    if (err) throw err;
    console.log("Database is connected");
});

// Route to display total number of passengers
app.get("/db", (req, res) => {
    const q = "SELECT COUNT(*) AS count FROM user_details";
    con.query(q, (err, results) => {
        if (err) throw err;
        const count = results[0].count;
        console.log("Total number of passengers: " + count);
        res.render("home", { count: count });
    });
});

// Route to render the delete page
app.get("/delete", (req, res) => {
    // Fetch the list of passengers to display in the delete page
    const q = "SELECT * FROM user_details";
    con.query(q, (err, result) => {
        if (err) {
            console.error("Error fetching passengers:", err);
            res.status(500).send("Internal Server Error");
            return;
        }
        res.render("delete", { passengers: result });
    });
});

// Route to handle deletion of a passenger
app.post("/delete", (req, res) => {
    const userId = req.body.userId; // Correct parameter name

    // SQL query to delete the passenger with the specified User ID
    const q = "DELETE FROM user_details WHERE User_id = ?";

    con.query(q, [userId], (err, result) => {
        if (err) {
            console.error("Error deleting passenger:", err);
            res.status(500).send("Internal Server Error");
            return;
        }
        console.log("Passenger deleted successfully");
        // Optionally, redirect the user to another page after deletion
        res.redirect("/display");
    });
});

// Route to insert passenger details
app.post("/register", (req, res) => {
    const { firstName, dob, gender, lastName, User_id, phoneNumber, Address } = req.body;

    const passInfo = {
        First_Name: firstName,
        DOB: dob,
        Gender: gender,
        Last_Name: lastName,
        User_id: User_id,
        PhoneNumber: phoneNumber,
        Address: Address
    };

    const q = "INSERT INTO user_details SET ?";
    con.query(q, passInfo, (err, result) => {
        if (err) {
            console.error("Error inserting passenger:", err);
            res.status(500).send("Error inserting passenger");
            return;
        }
        console.log("Passenger details inserted successfully");
        res.redirect("/db");
    });
});

// Route to display all passenger details
app.get("/display", (req, res) => {
    const q = "SELECT * FROM user_details";
    con.query(q, (err, result) => {
        if (err) throw err;
        res.render("showAll", { data: result });
    });
});

// Route to render search form
app.get("/search", (req, res) => {
    res.render("search");
});

// Route to handle search request
app.post("/search", (req, res) => {
    const id = req.body.id; // Change 'User_id' to 'id'
    const q = "SELECT * FROM user_details WHERE User_id = ?";

    con.query(q, [id], (err, result) => {
        if (err) {
            console.error("Error executing database query:", err);
            res.status(500).send("Internal Server Error");
            return;
        }

        if (result.length === 0) {
            console.log("No user found for ID:", id);
            res.render("searchResult", { data: null, count: 0 });
        } else {
            console.log("User found:", result[0]);
            res.render("searchResult", { data: result[0], count: result.length });
        }
    });
});

// Route to render update form
app.get("/update", (req, res) => {
    res.render("update");
});

// Route to handle update request
app.post("/update", (req, res) => {
    const { firstName, dob, gender, lastName, User_id, phoneNumber, Address } = req.body;

    const q = "UPDATE user_details SET First_Name = ?, DOB = ?, Gender = ?, Last_Name = ?, PhoneNumber = ?, Address = ? WHERE User_id = ?";
    const values = [firstName, dob, gender, lastName, phoneNumber, Address, User_id];

    con.query(q, values, (err, result) => {
        if (err) {
            console.error("Error updating passenger:", err);
            res.status(500).send("Internal Server Error");
            return;
        }
        console.log("Passenger details updated successfully");
        res.redirect("/display");
    });
});

// Routes for testing purposes
app.get("/", (req, res) => {
    res.send("The response is coming from express web server");
});

app.get("/hello", (req, res) => {
    console.log("The entered UserID is: " + req.query.User_id);
    res.send("The entered USER ID is: " + req.query.User_id);
});

app.post("/hello", (req, res) => {
    console.log("The entered student User_id is: " + req.body.User_id);
    res.send("The entered student User_id is: " + req.body.User_id);
});

app.get("/test", (req, res) => {
    res.send("This is another test route");
});

app.listen(portNumber, () => {
    console.log("Server is listening at portNumber: " + portNumber);
});
