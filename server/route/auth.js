const express = require ("express");
const authRouter =express.Router();
const user =require("../modeles/user.js");


authRouter.post('/api/signup',async(req,res)=>{
    try {
       const {name,email,image}= req.body
       let myUser = await user.findOne({
        email:email
       });
       if (!myUser){
        myUser = new user ({
            email:email,
            name:name,
            image:image
        });
        myUser = await myUser.save();
       }
       res.json({myUser});

    }catch(e){
        console.log(e);

    }
});

authRouter.get('/api/get',async(req,res)=>{

});
module.exports=authRouter;