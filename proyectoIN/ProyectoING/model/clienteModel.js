import mongoose, { Schema } from "mongoose";

const clienteSchema = new Schema({
    nombre: String,
    direccion: String,
    telefono: Number,
})

export const clienteModel = new mongoose.model('Clientes', clienteSchema)