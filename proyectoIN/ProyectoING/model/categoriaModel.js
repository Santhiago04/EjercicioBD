import mongoose, { Schema } from "mongoose";

const categoriaSchema = new Schema({
    nombre: String,
})

export const categoriaModel = new mongoose.model('Categorias', categoriaSchema)