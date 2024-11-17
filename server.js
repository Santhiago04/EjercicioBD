import { config } from "dotenv"
import express, {json} from "express"
import path from "path"
import { _dirname } from "C:\\Users\\andre\\OneDrive\\Escritorio\\ing_datos\\util\\_dirname.js"
import { connectDatabase } from "C::\\Users\\andre\\Onedrive\\Escritorio\\ing_datos\\config\\database.js"
import userRoutes from  "C:\\Users\\andre\\OneDrive\\Escritorio\\ing_datos\\routes\\userRoutes.js"
config()

connectDatabase()
.then(()=>{
    console.log("conexión establecida correctamente")
})
.catch(()=>{
    console.log("Error al conectar a la base de datos")
    process.exit(1)
})
const server=express()
const PORT=process.env.PORT

server.use(express.urlencoded({extended:true}));
server.use(express.static('public'))

server.set('view engine','ejs')
server.set('views',path.join(_dirname,'views'));
server.use(json())


server.use(userRoutes)

server.listen(PORT,()=> console.log('Server running en port $(PORT)'))

