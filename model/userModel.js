import mongoose, {Schema} from "mongoose";

const userSchema=new Schema({
    name:String,
    tipo:String,
    estado:String
})

export const userModel=new mongoose.model('Users',userSchema)
