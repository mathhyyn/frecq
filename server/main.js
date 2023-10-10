const express = require('express');
const app = express();
const port = 3000;

app.listen(port, () => {
    console.log("listen server " + port);
});

app.use(express.json());

const Users = require('./db/users');

let db_users = new Users();
app.get('/allUsers', db_users.loadProfilePage);
/* another requests */