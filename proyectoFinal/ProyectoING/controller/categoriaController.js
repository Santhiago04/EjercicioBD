import { categoriaModel } from "../model/categoriaModel.js";



export const create_categoria = async (peticion, respuesta) => {
  try {
      let data = peticion.body; // Obtener los datos del cuerpo de la petición
      const nuevaCategoria = new categoriaModel(data); // Crear una nueva instancia del modelo
      await nuevaCategoria.save(); // Guardar la nueva categoría en la base de datos

      let categorias = await categoriaModel.find(); // Obtener todas las categorías actualizadas
      respuesta.status(201).json(categorias); // Enviar la respuesta con los datos de todas las categorías
  } catch (error) {
      console.log(error);
      respuesta.status(500).json({ message: "Error al crear la categoría", error });
  }
};



// Obtener todas las categorías
export const get_datos = async (peticion, respuesta) => {
  try {
    // Imprimir los parámetros de la petición (si existen)
    console.log('Parámetros de la petición:', peticion.query);

    let categorias = await categoriaModel.find(); // Llamamos la función 'find' para obtener las categorías

    // Mostrar las categorías obtenidas en la consola
    console.log('Categorías obtenidas:', categorias);

    respuesta.status(200).json(categorias); // Enviamos los datos como respuesta en formato JSON
  } catch (error) {
    console.log('Error al obtener las categorías:', error); // Log del error
    respuesta.status(500).json({ message: "Error al obtener las categorías", error });
  }
};


export const update_categoria = async (peticion, respuesta) => {
  try {
    const { id } = peticion.params; // Obtener el ID de la categoría
    const data = peticion.body; // Obtener los nuevos datos de la categoría
    
    // Actualizar la categoría en la base de datos
    const categoriaActualizada = await categoriaModel.findByIdAndUpdate(id, data, { new: true });

    // Log en la terminal para ver el cambio realizado
    console.log('Categoría actualizada:', categoriaActualizada);

    // Enviar la respuesta con los datos actualizados
    respuesta.status(200).json(categoriaActualizada);
  } catch (error) {
    console.log(error);
    respuesta.status(500).json({ message: "Error al actualizar la categoría", error });
  }
};



