const path = require('path');
const express = require('express');
const app = express();
require('dotenv').config();
const port = process.env.SERV_PORT;

app.use(express.static(path.join(__dirname, 'dataset')))

app.get('/', (req, res) => {
    res.sendFile('${__dirname}/dataset/');
});

app.listen(port, () => {
    console.log("listen server " + port);
});

app.use(express.json());

const Users = require('./db/users');

let db_users = new Users();
app.get('/allUsers', db_users.getAllUsers);
app.get('/getUserById', db_users.getUserById);
app.get('/allImages', db_users.getAllImages);
app.get('/imageById', db_users.getImageById);

/* another requests */

console.log("pg port:", process.env.DB_PORT);
