const app = require('express').Router();
const usermodel = require('../model/user.modal');

app.post('/register', async (req, res, next) => {
    try{
        const {number,name,img,email,pass,type} = req.body;
        const user = await usermodel.findOne({email});
        const user2 = await usermodel.findOne({number});
        if(!user){
            if (!user2){
                const creteuser = new usermodel({number,name,img,email,pass,type});
                await creteuser.save();
                res.json({status:true,message:"User registered Successfully"});
            } else {
                res.json({status:false,message:"User Number already exist"});
            }
        } else{
            res.json({status:false,message:"User email already exist"});
        }
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

app.post('/login', async (req, res, next) => {
    try{
        const {email,pass,deviceid} = req.body;
        const user = await usermodel.findOne({email});
        if(!user){
            res.status(200).json({status:false,message:"no user found"});
        } else{
            const isMatch = await user.comparePassword(pass);
            if(isMatch == false){
                res.status(200).json({status:false,message:"invalid password"});
            } else{
                await usermodel.findByIdAndUpdate(user._id, { $set: { deviceid: deviceid } });
                res.status(200).json({status:true,token:user,message:"login in successfully"});
            }
        }
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller login"});
    }
});

app.post('/findone', async (req, res, next) => {
    try{
        const {email} = req.body;
        const user = await usermodel.findOne({email});
        res.status(200).json({data:user}); 
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

app.post('/allusers', async (req, res, next) => {
    try{
        const user = await usermodel.find();
        res.status(200).json({data:user}); 
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});


app.post('/deleteusers', async (req, res, next) => {
    try{
        const {id} = req.body;
        await usermodel.findByIdAndDelete(id);
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

module.exports = app;
