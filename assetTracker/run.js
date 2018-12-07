// Run.js - Running the application

const express = require('express');
const app = express();
const path = require('path');

const port = process.env.PORT || 8000;

app.listen(port, () => {
	console.log(`App is listening on ${port}`);
})

// Setting the views folder to call files from
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// app.use(express.static(__dirname + '/'));

// Calling the profile.ejs file from the views folder when on /u
app.get('/', (req, res) => { 
	res.render('home');
});