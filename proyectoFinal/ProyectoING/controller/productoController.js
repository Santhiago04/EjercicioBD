import { productoModel } from "../model/productoModel.js";



// Crear un nuevo producto
export const create_producto = async (peticion, respuesta) => {
  try {
      let data = peticion.body; // Obtener datos del cuerpo de la petición
      const nuevoProducto = new productoModel(data); // Crear nueva instancia del modelo
      await nuevoProducto.save(); // Guardar en la base de datos
      let productos = await productoModel.find(); // Obtener todos los productos actualizados
      respuesta.status(201).json(productos); // Enviar los datos como JSON
  } catch (error) {
      console.error(error);
      respuesta.status(500).json({ message: "Error al crear el producto", error });
  }
};


export const get_datos = async (peticion, respuesta) => {
    try {
      const { nombre_categoria, stock } = peticion.query; // Parámetros de consulta
      console.log('Parametro nombre_categoria recibido:', nombre_categoria); // Log para verificar el valor de 'nombre_categoria'
      console.log('Parametro stock recibido:', stock); // Log para verificar el valor de 'stock'
  
      let productos;
  
      // Si 'nombre_categoria' es proporcionado, buscar por nombre de categoría
      if (nombre_categoria) {
        const categoriaLimpiada = nombre_categoria.trim();
        console.log('Nombre de categoría limpio para la búsqueda:', categoriaLimpiada); // Log para verificar el nombre limpio
        const regex = new RegExp(categoriaLimpiada, "i"); // "i" hace que sea insensible a mayúsculas y minúsculas
        console.log('Expresión regular generada para categoría:', regex); // Log para verificar la expresión regular
  
        productos = await productoModel.find({
          nombre_categoria: { $regex: regex } // Búsqueda por categoría
        });
      } else if (stock) {
        // Si se pasa 'stock', buscamos por cantidad de stock
        console.log('Buscando por stock mayor o igual a:', stock);
        productos = await productoModel.find({ stock: { $gte: Number(stock) } }); // Filtrar por stock mayor o igual
      } else {
        // Si no se pasa ningún parámetro de filtro, devolver todos los productos
        console.log('Buscando todos los productos');
        productos = await productoModel.find();
      }
  
      // Verificar los productos encontrados antes de enviarlos
      console.log('Productos encontrados:', productos); // Log para ver qué productos han sido encontrados
  
      // Enviar la respuesta con los productos encontrados
      respuesta.status(200).json(productos);
    } catch (error) {
      console.error('Error al obtener los productos:', error); // Log para el error si ocurre
      respuesta.status(500).json({ message: "Error al obtener los productos", error });
    }
  };


  export const update_producto = async (peticion, respuesta) => {
    try {
      const { id } = peticion.params;
      const data = peticion.body;
  
      console.log(`ID del producto a actualizar: ${id}`);
      console.log('Datos nuevos:', data);
  
      const productoActualizado = await productoModel.findByIdAndUpdate(id, data, { new: true });
  
      if (productoActualizado) {
        console.log('Producto actualizado:', productoActualizado);
        respuesta.status(200).json(productoActualizado);
      } else {
        console.log(`Producto con ID ${id} no encontrado.`);
        respuesta.status(404).json({ message: "Producto no encontrado" });
      }
    } catch (error) {
      console.error('Error al actualizar el producto:', error);
      respuesta.status(500).json({ message: "Error al actualizar el producto", error });
    }
  };
  

  export const delete_producto = async (peticion, respuesta) => {
    try {
      const { id } = peticion.params;
  
      console.log(`ID del producto a eliminar: ${id}`);
      const productoEliminado = await productoModel.findById(id);
  
      if (!productoEliminado) {
        console.log(`Producto con ID ${id} no encontrado.`);
        return respuesta.status(404).json({ message: "Producto no encontrado" });
      }
  
      console.log('Producto que será eliminado:', productoEliminado);
      await productoModel.findByIdAndDelete(id);
  
      console.log(`Producto con ID ${id} eliminado exitosamente.`);
      respuesta.status(200).json({ message: "Producto eliminado con éxito", productoEliminado });
    } catch (error) {
      console.error('Error al eliminar el producto:', error);
      respuesta.status(500).json({ message: "Error al eliminar el producto", error });
    }
  };
  


  export const contar_stock = async (peticion, respuesta) => {
    try {
      const { nombre_categoria } = peticion.query;
      const filtro = nombre_categoria ? { nombre_categoria: new RegExp(nombre_categoria, "i") } : {};
      console.log('Filtro aplicado:', filtro);
  
      const totalStock = await productoModel.aggregate([
        { $match: filtro },
        { $group: {_id: null, totalStock: { $sum: "$stock" } } }
      ]);
  
      console.log('Stock total calculado:', totalStock);
      respuesta.status(200).json(totalStock);
    } catch (error) {
      console.error('Error al contar el stock:', error);
      respuesta.status(500).json({ message: "Error al contar el stock", error });
    }
  };
  



  


