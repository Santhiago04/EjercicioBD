import { Router } from "express";
import { get_datos, create_cliente, update_cliente, delete_cliente} from "../controller/clienteController.js";
const router = Router()

router.get('/', get_datos)
router.post('/', create_cliente)
router.put('/:id', update_cliente);
router.delete('/:id', delete_cliente)


export default router;
