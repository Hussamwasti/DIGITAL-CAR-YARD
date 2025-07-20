const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const productSchema = new Schema({
    title:{type:String,  },
    des:{type:String,},
    img:[],
    price:{type:String,},
    status:{type:String,},
    uid:{type:String,},
});

const productModel = db.model('productSchema',productSchema);
module.exports = productModel;