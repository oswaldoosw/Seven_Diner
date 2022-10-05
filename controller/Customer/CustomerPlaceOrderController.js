// Imports
const express = require('express')
const app = express()
const expressLayouts = require('express-ejs-layouts')
const port = 3000;
var mysql = require('mysql');

var bodyParser = require('body-parser');
var urlencodedParser = require('urlencoded-parser'); // ES5
app.use(bodyParser.urlencoded({ extended: true }));
app.use(urlencodedParser);

const session = require('express-session');
const cookieParser = require("cookie-parser");
let alert = require('alert');
app.use(cookieParser());

app.use(express.static('public'))
app.use('/css', express.static(__dirname + 'public/css'))
app.use('/images', express.static(__dirname + 'public/images'))
const {Order} = require("../../entity/Order.js");
const {MenuItem} = require("../../entity/MenuItem.js");

class CustomerPlaceOrderController {

    CreateOrder(req, res){

        let order = new Order();

        var tableNumber = req.body.tableNumber;
        var ccNumber = req.body.ccNumber;
        var cvv = req.body.cvv;
        var expDate = req.body.expDate;
        var paymentMethod = req.body.paymentMethod;

        var orderDate = new Date();
        var dd = String(orderDate.getDate()).padStart(2, '0');
        var mm = String(orderDate.getMonth() + 1).padStart(2, '0'); //January is 0!
        var yyyy = orderDate.getFullYear();

        orderDate = yyyy + '-' + mm + '-' + dd;

        order.CreateOrder(tableNumber, ccNumber, cvv, expDate, paymentMethod, orderDate, function(result){

            res.redirect('/');
        });
    }

    FetchCurrentOrder(callback){
        let order = new Order(); 

        order.ShowCurrentOrderList(function(result){

            callback(result); 
        }); 
    }

    AddMenuItem(req, res){

        let order = new Order();
        var menuName = req.body.menuName;
        var price = req.body.price;
        var quantity = req.body.quantity;

        if (quantity === "")
        {
            quantity = 1;
        }

        order.AddMenuItem(menuName, price, quantity, function(result){
        
            res.redirect("/Customer/CustomerViewMenu");                   
        }); 
    }


    
}

exports.CustomerPlaceOrderController = CustomerPlaceOrderController;