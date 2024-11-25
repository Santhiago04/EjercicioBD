import { config } from "dotenv";
import express from "express";
import { connectDatabase } from "./config/database.js";

import categoriasRoutes from "./routes/categoriasRoutes.js";
import clientesRoutes from "./routes/clientesRoutes.js";
import productosRoutes from "./routes/productosRouter.js";
import ventasRoutes from "./routes/ventasRoutes.js";

config();

// Conexión a la base de datos
connectDatabase()
  .then(() => {
    console.log("Conexión exitosa a la base de datos.");
  })
  .catch((error) => {
    console.error("Error al conectar a la base de datos:", error);
    process.exit(1); // Finaliza la aplicación si hay error
  });

// Configuración del servidor
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware para procesar JSON
app.use(express.json());

// Configuración de rutas
app.use("/categorias", categoriasRoutes);
app.use("/clientes", clientesRoutes);
app.use("/productos", productosRoutes);
app.use("/ventas", ventasRoutes);

// Inicio del servidor
app.listen(PORT, () => console.log(`Servidor corriendo en el puerto ${PORT}`));
