import { Router } from "express"
import { get_datos, create_venta, update_venta, delete_venta, total_ventas_por_cliente} from "../controller/ventaController.js"

const router = Router()

router.get('/',get_datos)
router.post('/',create_venta)
router.put('/:id',update_venta)
router.delete('/:id', delete_venta)
router.get('/cliente/:nombre_cliente', total_ventas_por_cliente);
export default router;