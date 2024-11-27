import { Router } from "express"
import { get_datos, contar_stock, create_producto, update_producto, delete_producto} from "../controller/productoController.js"

const router = Router()
router.get('/',get_datos);
router.get('/stock', contar_stock);
router.post('/',create_producto);
router.put('/:id', update_producto);
router.delete('/:id', delete_producto);

export default router;