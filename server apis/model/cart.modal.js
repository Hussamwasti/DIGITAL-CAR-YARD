const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const cartSchema = new Schema({
    uid:{type:String,  },
    pid:{type:String,},
    quantity:{type:String,},
    type:{type:String,},
    isbook:{type:String,},
});

const cartModel = db.model('cartSchema',cartSchema);
module.exports = cartModel;