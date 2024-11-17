import { Router } from "express"
const router = Router()

router.get('/usuarios',get_datos)
router.post('/usuarios',create_Usuario)
export default router;

