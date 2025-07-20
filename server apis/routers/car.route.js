const app = require('express').Router();
const carmodel = require('../model/car.modal');

app.post('/registercar', async (req, res, next) => {
    try{
        const {title,des,img,price,milage,city,year,brand,register,color,engine,enginecapacity,transmission,assemble,status,uid} = req.body;
        const creteuser = new carmodel({title,des,img,price,milage,city,year,brand,register,color,engine,enginecapacity,transmission,assemble,status,uid});
        await creteuser.save();
        res.json({status:true,message:"car registered Sucessfully"});
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

app.post('/allcar', async (req, res, next) => {
    try{
        const user = await carmodel.find();
        res.status(200).json({data:user});       
    } catch (e){
        console.log(e)
        res.json({data:[]});
    }
});

app.post('/statuschange', async (req, res, next) => {
    try{
        const {id,status} = req.body;
        await carmodel.findByIdAndUpdate(id,{$set:{status:status}});
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

app.post('/deletecar', async (req, res, next) => {
    try{
        const {id} = req.body;
        await carmodel.findByIdAndDelete(id);
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

app.post('/findonecar', async (req, res, next) => {
    try{
        const {id} = req.body;
        const user = await carmodel.findById(id);
        res.status(200).json({data:user}); 
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

module.exports = app;
