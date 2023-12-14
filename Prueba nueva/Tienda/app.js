const express = require('express');
const app = express();

const logger = require('morgan');
const instanciaRouter = require('./routes/taskRouter');

app.use(logger('dev'));
app.use(express.json());
app.use(instanciaRouter);

module.exports = app;