import mongoose, { Schema } from "mongoose";

const ventaSchema = new Schema({
    fecha_venta: Date,
    nombre_cliente: String,
    descripcion: String,
})

export const ventaModel = new mongoose.model('Ventas', ventaSchema)