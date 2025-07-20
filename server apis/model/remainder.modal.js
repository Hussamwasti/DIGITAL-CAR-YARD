const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const remainderSchema = new Schema({
    title:{type:String,},
    des:{type:String,},
    date:{type:String,},
    uid:{type:String,},
    freq:{type:String,},
});

const remainderModel = db.model('remainder',remainderSchema);
module.exports = remainderModel;