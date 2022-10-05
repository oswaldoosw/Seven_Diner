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

const sessions = require('express-session');
const cookieParser = require("cookie-parser");

app.use(cookieParser());

app.use(express.static('public'))
app.use('/css', express.static(__dirname + 'public/css'))
app.use('/images', express.static(__dirname + 'public/images'))
const {Order} = require("../../entity/Order.js");
const {MenuItem} = require("../../entity/MenuItem.js");
const {DeleteCurrentOrderController} = require("../DeleteCurrentOrderController.js");

class CustomerViewOrderController {

    ViewOrder(req, res){
        let order = new Order();

        var tableNumber = req.body.tableNumber;
        

        order.ViewOrder(tableNumber, function(result){
            order.ShowCurrentOrderList(function(result1) {
                var path = require('path');
                var filePath = "./boundary/Customer/CustomerViewOrderUI.ejs"
                var resolvedPath = path.resolve(filePath);
                var price = 0;
                for (let i = 0; i < result1.length; i++)
                {
                    price = price + (result1[i].price * result1[i].quantity);
                }
                res.render(resolvedPath, {menuItemData : result1, pricing : price});
                
            });
            
        }); 
        let deleteCurrentOrderController = new DeleteCurrentOrderController();
        deleteCurrentOrderController.DeleteCurrentOrder(function(result) {
            
        });
    }
    
}

exports.CustomerViewOrderController = CustomerViewOrderController;