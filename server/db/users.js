const pool = require('./pool.js');

class Users {

    getAllUsers = async (request, response) => {
        await pool.query('select identifiedpersonid, name from identified_persons order by name', (error, results) => {
            if (error) {
                console.log(error);
                console.log("DETAILS ", error.detail);
                response.status(400).json(error);
            }
            else response.status(200).json(results.rows)
        });
    }

    getUserById = async (request, response) => {
        await pool.query('select * from identified_persons where identifiedpersonid = $1', [user_id], (error, results) => {
            if (error) {
                console.log(error);
                console.log("DETAILS ", error.detail);
                response.status(400).json(error);
            }
            else response.status(200).json(results.rows)
        });
    }

    /* another requests */

}

module.exports = Users;