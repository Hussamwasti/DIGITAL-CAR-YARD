const app = require('express').Router();
const remaindermodel = require('../model/remainder.modal');

app.post('/registerremainder', async (req, res, next) => {
    try{
        const {title,des,date,uid,freq} = req.body;
        const creteuser = new remaindermodel({title,des,date,uid,freq});
        await creteuser.save();
        res.json({status:true,message:"remainder registered Sucessfully"});
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

app.post('/allremainder', async (req, res, next) => {
    try{
        const {uid} = req.body;
        const user = await remaindermodel.find({uid:uid});
        res.status(200).json({data:user});       
    } catch (e){
        console.log(e)
        res.json({data:[]});
    }
});

app.post('/updateremdate', async (req, res, next) => {
    try{
        const {id,date} = req.body;
        const user = await remaindermodel.findByIdAndUpdate(id,{$set:{date:date}});
        res.status(200).json({data:user});       
    } catch (e){
        console.log(e)
        res.json({data:[]});
    }
});

module.exports = app;
