const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');
const flash = require('connect-flash');
const session = require('express-session');
const mySqlStored = require('express-mysql-session');
const { database } = require('./keys');
const passport = require('passport');
//inicializacion
const app = express();
require('./lib/passport');
//configuraciones
app.set('port', process.env.PORT || 4000);
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', exphbs.engine({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
}));
app.set('view engine', '.hbs');

//middlewares
app.use(session({
    secret: 'datafet',
    resave: false,
    saveUninitialized: false,
    store: new mySqlStored(database)
}))
app.use(flash());
app.use(morgan('dev'));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(passport.initialize());
app.use(passport.session());
//variables globales
app.use((req, res, next) => {
    app.locals.success = req.flash('success');
    app.locals.message = req.flash('message');
    app.locals.user = req.user;
    next();
})

//routes
app.use(require('./routes'));
app.use(require('./routes/authentication'));
app.use('/setusers', require('./routes/set_users'));
app.use('/lista_administrativos', require('./routes/lista_administrativos'));
app.use('/auth', require('./routes/authentication'));
app.use('/administrador', require('./routes/administrador'));
//public
app.use(express.static(path.join(__dirname, 'public')));
//iniciando servidor
app.listen(app.get('port'), () => {
    console.log('servcio disponible en puerto ', app.get('port'));
});