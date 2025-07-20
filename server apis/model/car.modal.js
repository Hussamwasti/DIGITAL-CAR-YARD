const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const carSchema = new Schema({
    title:{type:String,  },
    des:{type:String,},
    img:[],
    price:{type:String,},
    milage:{type:String,},
    city:{type:String,},
    year:{type:String,},
    brand:{type:String,},
    register:{type:String,},
    color:{type:String,},
    engine:{type:String,},
    enginecapacity:{type:String,},
    transmission:{type:String,},
    assembly:{type:String,},
    status:{type:String,},
    uid:{type:String,},
});

const carModel = db.model('carSchema',carSchema);
module.exports = carModel;