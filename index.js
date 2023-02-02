const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const cors = require('cors');

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(cors());

app.use(require('./routes/routes'));

app.listen(3000, () => {
    console.log('Server started on port 3000');
});