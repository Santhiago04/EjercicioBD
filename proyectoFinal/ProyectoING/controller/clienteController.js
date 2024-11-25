import { clienteModel } from "../model/clienteModel.js";


// Crear un nuevo cliente
export const create_cliente = async (peticion, respuesta) => {
  try {
      let data = peticion.body; // Obtener datos del cuerpo de la petición
      const nuevoCliente = new clienteModel(data); // Crear nueva instancia del modelo
      await nuevoCliente.save(); // Guardar en la base de datos
      let clientes = await clienteModel.find(); // Obtener todos los clientes actualizados
      respuesta.status(201).json(clientes); // Enviar los datos como JSON
  } catch (error) {
      console.error(error);
      respuesta.status(500).json({ message: "Error al crear el cliente", error });
  }
};

// Obtener todos los clientes o filtrar por nombre o teléfono
export const get_datos = async (peticion, respuesta) => {
  try {
    const { nombre, telefono } = peticion.query; // Parámetros opcionales de consulta
    console.log('Parametro nombre recibido:', nombre); // Verifica si el valor del nombre es correcto
    let clientes;

    // Si 'nombre' es proporcionado, buscamos una coincidencia parcial
    if (nombre) {
      const nombreLimpiado = nombre.trim(); // Limpiar posibles espacios
      console.log('Nombre limpio para la búsqueda:', nombreLimpiado); // Verifica que el nombre esté limpio
      const regex = new RegExp(nombreLimpiado, "i"); // 'i' hace que la búsqueda sea insensible a mayúsculas y minúsculas
      console.log('Expresión regular generada para nombre:', regex); // Verifica la expresión regular

      clientes = await clienteModel.find({
        nombre: { $regex: regex } // Buscar coincidencias parciales en nombre
      });
    } else if (telefono) {
      // Si existe 'telefono', buscamos por teléfono exacto
      console.log('Buscando por teléfono:', telefono);
      clientes = await clienteModel.find({ telefono: Number(telefono) });
    } else {
      // Si no hay filtro, devuelve todos los clientes
      console.log('Buscando todos los clientes');
      clientes = await clienteModel.find(); 
    }

    // Verificar los clientes encontrados antes de enviarlos
    console.log('Clientes encontrados:', clientes); // Verifica qué resultados devuelve la consulta
    respuesta.status(200).json(clientes);
  } catch (error) {
    console.error('Error al obtener los clientes:', error); // Si ocurre un error, lo mostramos
    respuesta.status(500).json({ message: "Error al obtener los clientes", error });
  }
};


export const update_cliente = async (peticion, respuesta) => {
  try {
    const { id } = peticion.params; // Obtener el ID del cliente
    const data = peticion.body; // Obtener los nuevos datos del cliente

    console.log(`ID del cliente a actualizar: ${id}`); // Log del ID
    console.log("Datos enviados para la actualización:", data); // Log de los datos proporcionados

    const clienteOriginal = await clienteModel.findById(id); // Obtener el cliente antes de actualizar
    console.log("Datos actuales del cliente antes de la actualización:", clienteOriginal); // Log del cliente original

    const clienteActualizado = await clienteModel.findByIdAndUpdate(id, data, { new: true }); // Actualizar el cliente

    console.log("Datos actualizados del cliente:", clienteActualizado); // Log del cliente actualizado

    respuesta.status(200).json(clienteActualizado);
  } catch (error) {
    console.error("Error al actualizar el cliente:", error); // Log del error
    respuesta.status(500).json({ message: "Error al actualizar el cliente", error });
  }
};



export const delete_cliente = async (peticion, respuesta) => {
  try {
    const { id } = peticion.params; // Obtener el ID del cliente
    console.log(`ID del cliente a eliminar: ${id}`); // Log del ID del cliente

    const clienteEliminado = await clienteModel.findById(id); // Buscar el cliente antes de eliminarlo
    if (!clienteEliminado) {
      console.log(`No se encontró el cliente con ID: ${id}`); // Log si no se encuentra el cliente
      return respuesta.status(404).json({ message: "Cliente no encontrado" });
    }

    console.log("Datos del cliente que será eliminado:", clienteEliminado); // Log del cliente antes de eliminar

    await clienteModel.findByIdAndDelete(id); // Eliminar el cliente

    console.log(`Cliente con ID ${id} eliminado exitosamente.`); // Log de confirmación de eliminación

    respuesta.status(200).json({ message: "Cliente eliminado con éxito", clienteEliminado });
  } catch (error) {
    console.error("Error al eliminar el cliente:", error); // Log del error
    respuesta.status(500).json({ message: "Error al eliminar el cliente", error });
  }
};



  
  
  
  
  

