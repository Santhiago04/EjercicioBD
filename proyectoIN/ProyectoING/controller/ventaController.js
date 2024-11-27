import { ventaModel } from "../model/ventaModel.js";


// Crear una nueva venta
export const create_venta = async (peticion, respuesta) => {
  try {
      let data = peticion.body; // Obtener datos del cuerpo de la petición
      const nuevaVenta = new ventaModel(data); // Crear nueva instancia del modelo
      await nuevaVenta.save(); // Guardar en la base de datos
      let ventas = await ventaModel.find(); // Obtener todas las ventas actualizadas
      respuesta.status(201).json(ventas); // Enviar los datos como JSON
  } catch (error) {
      console.error(error);
      respuesta.status(500).json({ message: "Error al crear la venta", error });
  }
};


export const get_datos = async (peticion, respuesta) => {
  try {
    const { nombre_cliente, fecha_venta } = peticion.query; 
    console.log('Parámetros recibidos:', { nombre_cliente, fecha_venta }); 

    let ventas;

    // Filtrar por nombre del cliente
    if (nombre_cliente) {
      const nombreLimpiado = nombre_cliente.trim(); 
      console.log('Nombre limpio para la búsqueda:', nombreLimpiado); 
      const regex = new RegExp(nombreLimpiado, "i"); 
      console.log('Expresión regular generada para nombre:', regex); 

      ventas = await ventaModel.find({
        nombre_cliente: { $regex: regex } 
      });
    } 
    // Filtrar por fecha de la venta
    else if (fecha_venta) {
      const fecha = new Date(fecha_venta);
      console.log('Fecha recibida:', fecha); 
      if (!isNaN(fecha)) { 
        const fechaInicio = new Date(fecha.setHours(0, 0, 0, 0)); 
        const fechaFin = new Date(fecha.setHours(23, 59, 59, 999)); 
        console.log('Rango de fechas:', { fechaInicio, fechaFin }); 

        ventas = await ventaModel.find({
          fecha_venta: { $gte: fechaInicio, $lte: fechaFin } 
        });
      } else {
        return respuesta.status(400).json({ message: "Fecha no válida" });
      }
    } 

    else {
      console.log('Buscando todas las ventas'); 
      ventas = await ventaModel.find();
    }

    console.log('Ventas encontradas:', ventas); 

    respuesta.status(200).json(ventas);
  } catch (error) {
    console.error('Error al obtener las ventas:', error); 
    respuesta.status(500).json({ message: "Error al obtener las ventas", error });
  }
};

export const update_venta = async (peticion, respuesta) => {
  try {
    const { id } = peticion.params; 
    const data = peticion.body; 

    console.log(`ID de la venta a actualizar: ${id}`);
    console.log('Datos nuevos para la actualización:', data);

    const ventaActualizada = await ventaModel.findByIdAndUpdate(id, data, { new: true });

    if (ventaActualizada) {
      console.log('Venta actualizada con éxito:', ventaActualizada);
      respuesta.status(200).json(ventaActualizada);
    } else {
      console.log(`Venta con ID ${id} no encontrada.`);
      respuesta.status(404).json({ message: "Venta no encontrada" });
    }
  } catch (error) {
    console.error('Error al actualizar la venta:', error);
    respuesta.status(500).json({ message: "Error al actualizar la venta", error });
  }
};


export const delete_venta = async (peticion, respuesta) => {
  try {
    const { id } = peticion.params; 

    console.log(`ID de la venta a eliminar: ${id}`);
    const ventaEliminada = await ventaModel.findById(id);

    if (!ventaEliminada) {
      console.log(`Venta con ID ${id} no encontrada.`);
      return respuesta.status(404).json({ message: "Venta no encontrada" });
    }

    console.log('Venta que será eliminada:', ventaEliminada);
    await ventaModel.findByIdAndDelete(id);

    console.log(`Venta con ID ${id} eliminada con éxito.`);
    respuesta.status(200).json({ message: "Venta eliminada con éxito", ventaEliminada });
  } catch (error) {
    console.error('Error al eliminar la venta:', error);
    respuesta.status(500).json({ message: "Error al eliminar la venta", error });
  }
};

export const total_ventas_por_cliente = async (peticion, respuesta) => {
  console.log(peticion);
  try {
    
    const { nombre_cliente } = peticion.params; 
    
    console.log(`Buscando total de ventas para el cliente: "${nombre_cliente}"`); 


    const totalVentas = await ventaModel.aggregate([
      { $match: { nombre_cliente: new RegExp(nombre_cliente, "i") } }, 
      { $group: { _id: "$nombre_cliente", totalVentas: { $sum: 1 } } } 
    ]);

    if (totalVentas.length === 0) {
      console.log(`No se encontraron ventas para el cliente: "${nombre_cliente}"`);
      respuesta.status(404).json({ message: `No se encontraron ventas para el cliente: "${nombre_cliente}"` });
      return;
    }

    console.log(`Ventas totales encontradas para "${nombre_cliente}":`, totalVentas);
    respuesta.status(200).json(totalVentas);
  } catch (error) {
    console.error('Error al obtener el total de ventas por cliente:', error);
    respuesta.status(500).json({ message: "Error al obtener el total de ventas por cliente", error });
  }
};





