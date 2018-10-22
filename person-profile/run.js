const express = require('express');
const app = express();
const path = require('path');

app.listen(8000, () => {
	console.log('App is listening on port 8000');
})

// Setting the views folder to call files from
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// app.use(express.static(__dirname + '/'));

// Calling the profile.ejs file from the views folder when on /u
app.get('/u/', (req, res) => { 
	res.render('profile');
});

// Calling the create.ejs file from the views folder when on /create/
app.get('/create/', (req, res) => { 
	res.render('create');
});

// Calling the social.ejs file from the views folder when on /social/
app.get('/social/', (req, res) => { 
	res.render('social');
});