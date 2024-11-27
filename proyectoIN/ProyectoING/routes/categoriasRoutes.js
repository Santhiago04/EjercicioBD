import { Router } from "express"
import { get_datos, create_categoria, update_categoria, get_categorias_con_a} from "../controller/categoriaController.js"

const router = Router()

router.get('/',get_datos)
router.post('/',create_categoria)
router.put('/:id',update_categoria)
router.get('/cat_a', get_categorias_con_a)
export default router;