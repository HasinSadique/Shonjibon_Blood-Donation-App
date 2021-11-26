const client = require('./connection.js')
const express = require('express');
const { Client } = require('pg');
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');

const app = express();
const port = "3300"

app.listen(port, () => {
    console.log("Server is now listening at port: " + port);
});

app.use(express.json({ extended: false }));

client.connect();

app.get("/users", (req, res) => {
    let query = `Select * from "Users"`;
    client.query(query, (err, result) => {
        if (!err) {
            res.send(result.rows);
        } else {
            console.log(err);
        }
    });
    client.end;
});

app.post("/signup", async (req, res) => {
    const {
        Name, email, password, Mobile, Blood_Group, Age,
        Gender, Smoker, Last_Blood_Donated, Vaccinated, Is_Donor
    } = req.body;

    console.log("\nSigning up");
    console.log(email + "\n");
    // console.log(password);

    let queryCheck = `
    SELECT *
	FROM "Users"
	where "Email"='${email}';
    `;
    client.query(queryCheck, (err, result) => {
        if (!err) {
            if (result.rows[0] != null) {
                res.json({ error: 403 });
            } else {
                let queryInsert = `
                INSERT INTO public."Users"(
                    "Name", "Email", "Mobile", "Password", "Blood_Group", 
                    "Age", "Gender", "Smoker", 
                    "Vaccinated", "Is_Donor", "Last_Blood_Donated")
                    VALUES (
                        '${Name}', '${email}', '${Mobile}', '${password}', 
                        '${Blood_Group}', '${Age}', '${Gender}', '${Smoker}',
                        '${Vaccinated}', '${Is_Donor}','${Last_Blood_Donated}'
                        )`;

                client.query(queryInsert, async (err, result) => {
                    if (!err) {
                        let user = {
                            Email: email,
                            PASSWORD: password
                        }
                        const token = jwt.sign(user, "shhh");
                        res.json({ token: token });
                    } else {
                        console.log(err);
                    }
                });
            }
        } else {
            console.log(err);
        }
    });
    client.end;
});


app.post("/login", async (req, res) => {
    const { email, password } = req.body;

    //query to check for users with this email
    let queryLogin = `SELECT *
	FROM "Users"
	where "Email"='${email}';`

    client.query(queryLogin, (err, result) => {
        if (!err) {   //if no error, check if password correct or not.
            if ((result.rows[0] != undefined) && (result.rows[0]["Email"] == email)) {
                var Pass = result.rows[0]["Password"];

                if (password == Pass) {
                    console.log("User found.");

                    let user = {
                        id: result.rows[0]["UserID"],
                        email: result.rows[0]["Email"],
                        fullname: result.rows[0]["Name"],
                        mobile: result.rows[0]["Mobile"],
                        age: result.rows[0]["Age"],
                        bloodgroup: result.rows[0]["Blood_Group"],
                        Gender: result.rows[0]["Gender"],
                        smoker: result.rows[0]["Smoker"],
                        Vaccinated: result.rows[0]["Vaccinated"],
                        Donor: result.rows[0]["Is_Donor"],
                        Last_Donated: result.rows[0]["Last_Blood_Donated"],
                    }
                    //send token
                    const token = jwt.sign(user, "SignedInUser");

                    res.json({ token: token });
                } else {
                    console.log("Incorrect Password.");
                    res.json({ error: 403 });
                }
            } else {
                console.log("Incorrect email or password.");
                res.json({ error: 401 });
            }
        } else {
            console.log(err);
        }
    });
});

app.post("/post_blood_request", async (req, res) => {
    const { userID, post, location, bloodType } = req.body;
    
    let date_ob = new Date()
    let date = ("0" + date_ob.getDate()).slice(-2);
    let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
    let year = date_ob.getFullYear();
    let hours = date_ob.getHours();
    let minutes = date_ob.getMinutes();
    
    const created_timeStamp = Math.floor((Date.now())/1000);
    const created_Date = date + "-" + month + "-" + year;
    const created_Time = hours + ":" + minutes;

    console.log("\n \n" + (created_timeStamp / 1000) + "\n \n");
    console.log("\nBlood type: " + bloodType);
    console.log("post: " + post);
    console.log("UserID: " + userID + "\n");

    let queryPost = `
        INSERT INTO public."Posts"(
            "Post", "Blood_Type", "UID", "Date", "Time", "Inserted_Date"
        )VALUES (
            '${post}', '${bloodType}', '${userID}', '${created_Date}', '${created_Time}', '${created_timeStamp}');
    `;

    client.query(queryPost, async (err, result) => {
        if (!err) {
            res.json({ code: 200 });

        } else {
            console.log(err);
        }
    });

});
