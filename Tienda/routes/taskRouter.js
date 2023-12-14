const { Router } = require('express');
const instanciaRouter = Router();

const instanciaControlador = require('../controllers/taskControllers');

instanciaRouter.get('/:tabla', instanciaControlador.getAllTasks);
instanciaRouter.get('/:tabla/:id', instanciaControlador.getTasks);
instanciaRouter.get('/', instanciaControlador.getEverythingTasks);
instanciaRouter.get('/producto/fabricante/:fabricante', instanciaControlador.getEverythingProducts);

instanciaRouter.post('/:tabla', instanciaControlador.createTasks);

instanciaRouter.put('/:tabla/:id', instanciaControlador.updateTasks);

instanciaRouter.delete('/:tabla/:id', instanciaControlador.deleteTasks);

module.exports = instanciaRouter;
