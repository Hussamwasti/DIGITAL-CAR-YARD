const app = require('express').Router();
const productmodel = require('../model/product.modal');

app.post('/registerproduct', async (req, res, next) => {
    try{
        const {title,des,img,price,status,uid} = req.body;
        const creteuser = new productmodel({title,des,img,price,status,uid});
        await creteuser.save();
        res.json({status:true,message:"product registered Sucessfully"});
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

app.post('/allproduct', async (req, res, next) => {
    try{
        const user = await productmodel.find();
        res.status(200).json({data:user});       
    } catch (e){
        console.log(e)
        res.json({data:[]});
    }
});

app.post('/statuschangeproduct', async (req, res, next) => {
    try{
        const {id,status} = req.body;
        await productmodel.findByIdAndUpdate(id,{$set:{status:status}});
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

app.post('/deleteproduct', async (req, res, next) => {
    try{
        const {id} = req.body;
        await productmodel.findByIdAndDelete(id);
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

app.post('/findoneproduct', async (req, res, next) => {
    try{
        const {id} = req.body;
        const user = await productmodel.findById(id);
        res.status(200).json({data:user}); 
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

module.exports = app;
