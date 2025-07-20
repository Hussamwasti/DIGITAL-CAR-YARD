const express = require("express");
const bodyParser = require("body-parser")
const cors = require('cors');
const UserRoute = require("./routers/user.route");
const carRoute = require("./routers/car.route");
const remainderRoute = require("./routers/remainder.route");
const chatRoute = require("./routers/chat.route");
const productRoute = require("./routers/product.route");
const cartRoute = require("./routers/cart.route");

const app = express();
app.use(bodyParser.json());
app.use(cors());

app.use("/",UserRoute);
app.use("/",carRoute);
app.use("/",remainderRoute);
app.use("/",chatRoute);
app.use("/",productRoute);
app.use("/",cartRoute);

module.exports = app;
