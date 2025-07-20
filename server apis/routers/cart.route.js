const app = require('express').Router();
const cartmodel = require('../model/cart.modal');

app.post('/registercart', async (req, res, next) => {
    try{
        const {uid,pid,quantity,type,isbook} = req.body;
        const creteuser = new cartmodel({uid,pid,quantity,type,isbook});
        await creteuser.save();
        res.json({status:true,message:"cart registered Sucessfully"});
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

app.post('/allcart', async (req, res, next) => {
    try{
        const user = await cartmodel.find();
        res.status(200).json({data:user});       
    } catch (e){
        console.log(e)
        res.json({data:[]});
    }
});

app.post('/changecartproduct', async (req, res, next) => {
    try{
        const {id,quantity} = req.body;
        await cartmodel.findByIdAndUpdate(id,{$set:{quantity:quantity}});
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

app.post('/deletecart', async (req, res, next) => {
    try{
        const {id} = req.body;
        await cartmodel.findByIdAndDelete(id);
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

app.post('/checkout', async (req, res, next) => {
    try {
        const { uid } = req.body;

        const result = await cartmodel.updateMany(
            { uid },
            { $set: { isbook: true } }
        );

        res.json({
            status: true,
            message: `Updated ${result.modifiedCount} cart item(s) to isbook=true for user ${uid}`
        });
    } catch (e) {
        console.log(e);
        res.json({
            status: false,
            message: "Server error in controller register"
        });
    }
});


module.exports = app;
