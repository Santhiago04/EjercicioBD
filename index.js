const express=require('express');
const mongoose=require('mongoose');
const app=express();
const port=3000;
app.use(express.json());
mongoose.connect('mongodb://localhost:2701/mongodb',{
    useNewURLParser:True,
    useFieldTopology:True
}).then(()=>console.log("yei"))
.catch(err=>console.error('jkasjaks no conecto',err));

app.listen(port,()=>{
    console.log('servidor ejecutandose en puerto:$(port)');
})s