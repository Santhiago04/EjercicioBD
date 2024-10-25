//Conexion a BDMongo
const express=require('express');
const mongoose=require('mongoose');

const app=express();
const PORT=3000;

//Crear el cuerpo de las peticiones (Myddleware)
app.use(express.json());

//Conectarse con la BD
mongoose.connect('mongodb://localhost:2701/BDMonngo',{
    useNewURLParser:true,
    useUnifieldTopology:true

}).then(()=>console.log("Se conecto a MongoDB"))
.catch(err=>console.error('No se conecto a la BD por el error: ', err))

//Iniciar el servidor 
app.listen(PORT, ()=>{
    console.log('Servidor ejecutandose sobre el puerto: ${PORT}');
})
   
