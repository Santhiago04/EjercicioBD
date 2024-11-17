import {userModel} from "/model/userModel.js"

export const get_datos=async (peticion,respuesta)=>{
    try{
        let usuarios=await userModel.find
        respuesta.status(200).render("index",{usuarios})
    }catch(error){
        console.log(error)
    }
}

export const create_Usuario=async(peticion,respuesta)=>{
    try{
        let data=peticion.body
        await userModel.create(data)
        let usuarios=await userModel.find
        respuesta.status(200).render("index",{usuarios})
    }catch(error){
console.log(error)
    }
}