import mongoose, { Schema } from "mongoose";

const productoSchema = new Schema({
    descripcion: String,
    nombre_categoria: String,
    stock: Number,
})

export const productoModel = new mongoose.model('Productos', productoSchema)