import { Router } from "express"
import { get_datos, create_categoria, update_categoria} from "../controller/categoriaController.js"

const router = Router()

router.get('/',get_datos)
router.post('/',create_categoria)
router.put('/:id',update_categoria)
export default router;