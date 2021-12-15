const express=require('express');
//mongoose
const mongoose=require('mongoose');
const multer =require('multer')
//multer
require('dotenv').config();
const app=express();
const path = require('path');

mongoose.connect(process.env.DATABASE, {
    useNewUrlParser: true,
    useUnifiedTopology: true
  });
  
  mongoose.connection
    .on('open', () => {
      console.log('Mongoose connection open');
    })
    .on('error', (err) => {
      console.log(`Connection error: ${err.message}`);
    });
app.get('/',(req,res)=>{
res.send('I am testing the main route')
})

app.get("*",(req,res)=>{
    // res.send("This route doesnt exist")
    res.status(404).send("This is an Invalid URL")
})

 //Creates the server
app.listen(3000,console.log('Server is Running'))