const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const cors = require('cors');
const morgan = require('morgan');
const path = require('path');
const handlebars = require('hbs');
const hbs = require('express-handlebars');
const cookieParser = require('cookie-parser');
const adminRoutes = require('./src/routes/home');
const loginRoutes = require('./src/routes/login');
const logoutRoutes = require('./src/routes/logout');
const eventsRoutes = require('./src/routes/events');
const auth = require('./src/middlewares/auth')

const session = require('express-session');
const flash = require('express-flash');


const dotenv = require('dotenv');
require('./src/services/hbshelbers');
require('dotenv').config({
	path: '.env'
});
const uri = `mongodb+srv://${process.env.MONGO_ATLAS_USERNAME}:${process.env.MONGO_ATLAS_PW}@cluster0.aob8x.mongodb.net/` +
	`${process.env.MONGO_ATLAS_DBNAME}?readPreference=secondary&replicaSet=your_replSet_name&ssl=true`;
console.log('Connecting to database...');

mongoose.connect(uri, {
		useNewUrlParser: true,
		useCreateIndex: true,
		useUnifiedTopology: true
	})
	.then(() => {
		console.log('Connected to database successfully.');
	})
	.catch((err) => {
		console.log('Unable to connect to the mongodb instance. Error: ', err);
	});



const app = express();
app.use(morgan('dev'));
app.use(cors());

app.use(session({
	secret: 'sssssssssh!!!',
	cookie: {
		maxAge: 60000
	},
	resave: false,
	saveUninitialized: false
}));
app.use(flash());

app.use(bodyParser.urlencoded({
	extended: true
})); // for admin website
app.use(bodyParser.json()); // API Request
app.use(cookieParser());

handlebars.registerPartials(__dirname + '/src/views/partials');

app.set('view engine', 'hbs');
app.engine(
	'hbs',
	hbs({
		extname: 'hbs',
		defaultLayout: 'layout',
		layoutsDir: __dirname + '/src/views/layouts/',

	})
);

app.set('views', path.join(__dirname, '/src/views'));
app.use(express.static(__dirname + '/src/public'));
dotenv.config();
app.use(loginRoutes);
app.use(auth);
app.use('/', adminRoutes);
app.use(logoutRoutes);
app.use('/events', eventsRoutes);

module.exports = app;