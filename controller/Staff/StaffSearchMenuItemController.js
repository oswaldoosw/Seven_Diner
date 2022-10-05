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
const {StaffCreateOrderController} = require("../../controller/Staff/StaffCreateOrderController.js");

class StaffSearchMenuItemController {

    SearchMenuItem(req, res) {
        
        let menuItem = new MenuItem(); 
        
        var attributeType = "menuName";
        var menuName = req.body.menuName;

        let staffController2 = new StaffCreateOrderController();
        staffController2.FetchCurrentOrder(function(result1) {
            res.locals.cData = result1;
            menuItem.SearchMenuItem(attributeType, menuName, function(result){
                var path = require('path');
                var filePath = "./boundary/Staff/StaffCreateOrderUI.ejs"
                var resolvedPath = path.resolve(filePath);
                res.render(resolvedPath, {data : result});
            });
        });
        
    }
    
}

exports.StaffSearchMenuItemController = StaffSearchMenuItemController;