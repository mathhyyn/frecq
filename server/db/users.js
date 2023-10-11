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
        let user_id = request.query.id;
        await pool.query('select * from identified_persons where identifiedpersonid = $1', [user_id], (error, results) => {
            if (error) {
                console.log(error);
                console.log("DETAILS ", error.detail);
                response.status(400).json(error);
            }
            else response.status(200).json(results.rows)
        });
    }

    getAllImages = async (request, response) => {
        let user_id = request.query.id;
        await pool.query('select imageid, name from images order by dateandtime  where identifiedpersonid = $1', [user_id], (error, results) => {
            if (error) {
                console.log(error);
                console.log("DETAILS ", error.detail);
                response.status(400).json(error);
            }
            else response.status(200).json(results.rows)
        });
    }

    getImageById = async (request, response) => {
        let image_id = request.query.id;
        await pool.query('select * from images where imageid = $1', [image_id], (error, results) => {
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