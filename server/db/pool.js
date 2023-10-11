const { Pool } = require('pg');
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'face_and_speech_recognition',
    password: 'qwerty',
    port: 8007,
});

module.exports = pool;