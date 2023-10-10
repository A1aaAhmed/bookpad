// [npm run dev] to auto rerun when any change happens in this script
const express = require ("express");// == to import function
const mongoose = require ("mongoose");
const authRouter = require("./route/auth");
const cors=require("cors");
const app = express(); // initalized express 
const port = process.env.port | 3001;  // process.env.port for the site we deployed in  exit here 
const DB = "mongodb+srv://alaaahmad:aala4321@cluster0.olfdqfe.mongodb.net/?retryWrites=true&w=majority";
//makeing an API 
//mainplation of data in middle where 
app.use(cors());
app.use(express.json());
app.use(authRouter);

mongoose.connect(DB).then(()=>{  // is a promise waiting something 
    console.log("connected to DB");
}).catch((e)=>{
    console.log(e);

});

// listenimg to the server and response
app.listen(port,"0.0.0.0",()=>{ // this function is called whenever the app is called
    // "0.0.0.0" can be access from any ip adress 
   
console.log(`connected to ${port}`);
}
); 

