console.log("Hello World");
const express=require('express');
const mongoose=require("mongoose");
const authRouter=require("./routes/auth");

//Init
const PORT = 3000;// const port for 

const app =express();
const DB ="mongodb+srv://ErrorDevloper:hamza123@cluster0.jprkfpa.mongodb.net/?retryWrites=true&w=majority";


mongoose.connect(DB).then(()=>{
    console.log("Conection Susccesful ")
}).catch(e=>{
    console.log(e )
})

app.use(express.json());
app.use(authRouter);
app.listen(PORT,"0.0.0.0" ,()=>{
    console.log(`Connected at port ${PORT}`);
})
