const { application } = require('express');
const util = require('util');
var mysql = require('mysql');
const e = require('connect-flash');
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "restaurantapp"
});

con.connect();

class Order {
    orderID;
    menuList;
    totalPrice;
    paymentMethod;
    couponCode;
    customerUsername;
    orderDate;

    constructor(orderID, menuList, totalPrice, paymentMethod, couponCode, customerUsername, orderDate){
        this.orderID = orderID;
        this.menuList = menuList;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.couponCode = couponCode;
        this.customerUsername = customerUsername;
        this.orderDate = orderDate;
    }

    getOrderID()
    {
        return this.orderID;
    }

    setOrderID(orderID)
    {
        this.orderID = orderID;
    }

    getMenuList()
    {
        return this.menuList;
    }

    setMenuList(menuList)
    {
        this.menuList = menuList;
    }

    getTotalPrice()
    {
        return this.totalPrice;
    }

    setTotalPrice(totalPrice)
    {
        this.totalPrice = totalPrice;
    }

    getPaymentMethod()
    {
        return this.paymentMethod;
    }

    setPaymentMethod(paymentMethod)
    {
        this.paymentMethod = paymentMethod;
    }

    getCouponCode()
    {
        return this.couponCode;
    }

    setCouponCode(couponCode)
    {
        this.couponCode = couponCode;
    }

    getCustomerUsername()
    {
        return this.customerUsername;
    }

    setCustomerUsername(customerUsername)
    {
        this.customerUsername = customerUsername;
    }

    getOrderDate()
    {
        return this.orderDate;
    }

    setOrderDate(orderDate)
    {
        this.orderDate = orderDate;
    }


    //THIS IS ON THE STAFF CREATE ORDER FUNCTIONALITY, NOT STAFF SEARCH ORDER FUNCTION
    AddMenuItem(menuName, price, quantity, callback){

        var sql = "INSERT INTO currentorder (menuName, price, quantity) VALUES ('" + menuName + "', '" + price + "', '" + quantity + "')";

        con.query(sql, function(err, results){
            if (err){ 
            throw err;
            
            }       
            var dataRes = results;

            return callback(dataRes);
        })
    }

    //THIS IS ON THE STAFF CREATE ORDER FUNCTIONALITY, NOT STAFF SEARCH ORDER FUNCTION
    ShowCurrentOrderList(callback){

        let sql = "SELECT * FROM currentorder;";

        con.query(sql, function(err, results){
            if (err){throw err;}

            var aRes;
            if(results.length>0) { //result is not empty

                aRes = results;
                
                return callback(aRes);

                } else {
                    return callback(false);
                }
        })
    }

    //THIS IS ON THE STAFF CREATE ORDER FUNCTIONALITY, NOT STAFF SEARCH ORDER FUNCTION
    DeleteMenuItem(placeholderID, callback){

        let sql = "DELETE FROM currentorder WHERE placeholderID = '" + placeholderID + "';";

        con.query(sql, function(err, results){
            if (err){ 
                throw err;
            } 
            
            return callback(true);
        });
    }

    //THIS IS ON THE STAFF CREATE ORDER FUNCTIONALITY, NOT STAFF SEARCH ORDER FUNCTION
    CreateOrder(tableNumber, ccNumber, cvv, expDate, paymentMethod, orderDate, callback){

        //Select
        let sql = "SELECT menuName, price, quantity FROM currentorder;";
        var menuList = "";
        var totalPrice = 0.0;

        con.query(sql, function(err, results){
            if (err){ 

                throw err;
            } 
            
            for (let i = 0; i < results.length; i++) {

                menuList = menuList + results[i].quantity + "_" + results[i].menuName  + ", ";
                totalPrice = totalPrice + (results[i].price * results[i].quantity);
            }


            totalPrice = totalPrice.toFixed(2);
    
            //Insert
            let sql1 = "INSERT INTO orders (menuList, totalPrice, paymentMethod, ccNumber, cvv, expDate, orderDate, tableNumber) VALUES ('" + menuList + "', '"
             + totalPrice + "', '" + paymentMethod + "', '" + ccNumber + "', '" + cvv + "', '" + expDate  + "', '" + orderDate + "', '" + tableNumber + "')";
    
            con.query(sql1, function(err, results){
                
                if (err){ 
                    throw err;
                } 

                //Delete
                let sql2 = "DELETE FROM currentorder;";
        
                con.query(sql2, function(err, results){
                    if (err){ 
                        throw err;
                    } 
                    
                    return callback(true);
                });
            });
        });
    }

    //hehe
    ShowOrder (callback) {
        let sql = "SELECT orderID, menuList, totalPrice, paymentMethod, ccNumber, orderDate, tableNumber FROM orders;";

        con.query(sql, function(err, results){
            if (err){throw err;}

        var aRes;

        if(results.length>0) { //result is not empty
            for (let i = 0; i < results.length; i++)
            {
                results[i].orderDate = results[i].orderDate.toLocaleString([], { year: 'numeric', month: 'numeric', day: 'numeric' }).split('-')[0];
                // results[i].orderDate = results[i].orderDate.toLocaleString([], { year: 'numeric', month: 'numeric', day: 'numeric' }).split('-')[0];
            }
            aRes = results;

            return callback(aRes);

            } else {
                return callback(false);
            }
        })
    }
    SearchOrder (orderID, callback) {
        
        let sql = "SELECT * FROM orders WHERE orderID = '" + orderID + "'";

        con.query(sql, function(err, results){
            if (err){ 
                throw err;       
            }

            var dataRes;

            if(results.length>0) { //result is not empty
                for (let i = 0; i < results.length; i++)
                {
                    // results[i].orderDate = results[i].orderDate.toISOString().split('T')[0];
                    results[i].orderDate = results[i].orderDate.toLocaleString([], { year: 'numeric', month: 'numeric', day: 'numeric' }).split('-')[0];
                }
                dataRes = results;

                return callback(dataRes);

            } 
            else {
                return callback(false);
            }
        })
    }

    UpdateOrder(orderID, menuList, totalPrice, paymentMethod, ccNumber, tableNumber, callback){

        let sql = "UPDATE orders SET menuList = '" + menuList + "', totalPrice = '" 
        + totalPrice + "', paymentMethod = '" + paymentMethod + "', ccNumber = '" + ccNumber + 
        "', tableNumber = '" + tableNumber +"' WHERE orderID = '" + orderID + "';";

        con.query(sql, function(err, results){
            if (err){ 
                throw err;
            } 
            
            return callback(true);
        });
    }

    DeleteOrder(orderID, callback){

        let sql = "DELETE FROM orders WHERE orderID = '" + orderID + "';";

        con.query(sql, function(err, results){
            if (err){ 
                throw err;
            } 
            
            return callback(true);
        });
    }

    ViewOrder(tableNumber, callback){
        let sql = "SELECT * FROM orders WHERE tableNumber = '" + tableNumber + 
        "' AND orderID = (SELECT MAX(orderID) FROM orders);";
        const foodArr = [];
        const qtyArr = [];

        con.query(sql, function(err, results){
            if (err){ 
                throw err;
            } 
            for (let x = 0; x < results.length; x++)
            {
                var menu = results[x].menuList.split(', ');
                for (let j = 0; j < menu.length; j++)
                {
                    if (menu[j] !== '')
                    {
                        var menuN = menu[j].split('_');
                        foodArr.push(menuN[1]);
                        qtyArr.push(parseInt(menuN[0]));
                    }
                }
            }
            for (let i = 0; i < foodArr.length; i++)
            {
                let sql1 = "SELECT * FROM menuitem WHERE menuName = '" + foodArr[i] + "';";
                con.query(sql1, function(err, results1){
                    if (err){ 
                        throw err;
                    } 
                    for (let l = 0; l < results1.length; l++)
                    {
                        let sql2 = "INSERT INTO currentorder (menuName, price, quantity) VALUES ('" 
                                    + results1[l].menuName + "', '" + results1[l].price + "', '" + qtyArr[i] + "')";
                        con.query(sql2, function(err, results2){
                            if (err){ 
                                throw err;
                            }
                        });
                    }
                });
            }
            let sql = "SELECT * FROM currentorder;";

            con.query(sql, function(err, results3){
                if (err){throw err;}

                var aRes;
                if(results3.length>0) { //result is not empty

                    aRes = results3;
                    
                    return callback(results);

                    } else {
                        return callback(false);
                    }
            })
            
        });
    }

    DeleteCurrentOrder(callback){

        let sql = "DELETE FROM currentorder";

        con.query(sql, function(err, results){
            if (err){ 
                throw err;
            } 
            
            return callback(true);
        });
    }


 

    GetAverageSpendPerDay(datePerDay, callback){

        let sql = "SELECT * FROM orders WHERE orderDate = '" + datePerDay + "'";

        con.query(sql, function(err, results){
            if (err){ 
                throw err;       
            }

            var dataRes;
            var orderDetails;
            var averageSpend = 0;
            if(results.length>0) { //result is not empty
                
                for (let i = 0; i < results.length; i++)
                {
                    averageSpend = averageSpend + results[i].totalPrice;
                    results[i].orderDate = results[i].orderDate.toLocaleString([], { year: 'numeric', month: 'numeric', day: 'numeric' }).split('-')[0];
                }

                if (results.length > 0)
                {
                    averageSpend = averageSpend/results.length;
                    averageSpend = averageSpend.toFixed(2);
                }
                dataRes = averageSpend;
                orderDetails = results;

                return callback(orderDetails, dataRes);

            } 
            else {
                return callback(false, averageSpend);
            }
        })
    }

    GetAverageSpendPerWeek(datePerWeek, callback){

        let sql = "SELECT * FROM orders where orderdate between date_sub('" + datePerWeek + "',INTERVAL 1 WEEK) and '" + datePerWeek + "';";

        

        con.query(sql, function(err, results){
            if (err){ 
                throw err;       
            }

            var dataRes;
            var orderDetails;
            var averageSpend = 0;
            if(results.length>0) { //result is not empty
                
                for (let i = 0; i < results.length; i++)
                {
                    averageSpend = averageSpend + results[i].totalPrice;
                    results[i].orderDate = results[i].orderDate.toLocaleString([], { year: 'numeric', month: 'numeric', day: 'numeric' }).split('-')[0];
                }

                if (results.length > 0)
                {
                    averageSpend = averageSpend/results.length;
                    averageSpend = averageSpend.toFixed(2);
                }
                dataRes = averageSpend;
                orderDetails = results;

                return callback(orderDetails, dataRes);

            } 
            else {
                return callback(false, averageSpend);
            }
        })
    }

    GetAverageSpendPerMonth(datePerMonth, callback){
        let sql = "SELECT * FROM orders where orderdate between date_sub('" + datePerMonth + "',INTERVAL 1 MONTH) and '" + datePerMonth + "';";

        

        con.query(sql, function(err, results){
            if (err){ 
                throw err;       
            }

            var dataRes;
            var orderDetails;
            var averageSpend = 0;
            if(results.length>0) { //result is not empty
                
                for (let i = 0; i < results.length; i++)
                {
                    averageSpend = averageSpend + results[i].totalPrice;
                    results[i].orderDate = results[i].orderDate.toLocaleString([], { year: 'numeric', month: 'numeric', day: 'numeric' }).split('-')[0];
                }
                if (results.length > 0)
                {
                    averageSpend = averageSpend/results.length;
                    averageSpend = averageSpend.toFixed(2);
                }
                dataRes = averageSpend;
                orderDetails = results;

                return callback(orderDetails, dataRes);

            } 
            else {
                return callback(false, averageSpend);
            }
        })
    }

    GetFrequencyOfVisitPerDay(datePerDay, callback){
        let sql = "SELECT * FROM orders WHERE orderDate = '" + datePerDay + "'";

        

        con.query(sql, function(err, results){
            if (err){ 
                throw err;       
            }

            var dataRes;

            if(results.length>0) { //result is not empty
                for (let i = 0; i < results.length; i++)
                {
                    results[i].orderDate = results[i].orderDate.toLocaleString([], { year: 'numeric', month: 'numeric', day: 'numeric' }).split('-')[0];
                }
                
                dataRes = results;

                return callback(dataRes);

            } 
            else {
                return callback(false);
            }
        })
    }

    GetFrequencyOfVisitPerWeek(datePerWeek, callback){
        let sql = "SELECT * FROM orders where orderdate between date_sub('" + datePerWeek + "',INTERVAL 1 WEEK) and '" + datePerWeek + "';";

        

        con.query(sql, function(err, results){
            if (err){ 
                throw err;       
            }

            var dataRes;

            if(results.length>0) { //result is not empty
                for (let i = 0; i < results.length; i++)
                {
                    results[i].orderDate = results[i].orderDate.toLocaleString([], { year: 'numeric', month: 'numeric', day: 'numeric' }).split('-')[0];
                }
                
                dataRes = results;

                return callback(dataRes);

            } 
            else {
                return callback(false);
            }
        })
    }

    GetFrequencyOfVisitPerMonth(datePerMonth, callback){
        let sql = "SELECT * FROM orders where orderdate between date_sub('" + datePerMonth + "',INTERVAL 1 MONTH) and '" + datePerMonth + "';";

        

        con.query(sql, function(err, results){
            if (err){ 
                throw err;       
            }

            var dataRes;

            if(results.length>0) { //result is not empty
                for (let i = 0; i < results.length; i++)
                {
                    results[i].orderDate = results[i].orderDate.toLocaleString([], { year: 'numeric', month: 'numeric', day: 'numeric' }).split('-')[0];
                }
                
                dataRes = results;

                return callback(dataRes);

            } 
            else {
                return callback(false);
            }
        })
    }

    GetPreferredDishesPerDay(datePerDay, callback){
        let sql = "SELECT * FROM orders WHERE orderDate = '" + datePerDay + "'";
        const arr = [];
        const arrqty = [];

        con.query(sql, function(err, results){
            if (err){ 
                throw err;       
            }

            var dataRes;
            var dataQuan;

            if(results.length>0) { //result is not empty
                

                for (let i = 0; i < results.length; i++)
                {
                    var menu = results[i].menuList.split(', ');
                    
                    for (let j = 0; j < menu.length; j++)
                    {
                        if (menu[j] !== '')
                        {
                            var menuN = menu[j].split('_');
                            if (arr.indexOf(menuN[1]) === -1)
                            {
                                arr.push(menuN[1]);
                                arrqty.push(parseInt(menuN[0]));
                            } 
                            else
                            {
                                var index = arr.indexOf(menuN[1]);
                                var quan = arrqty[index];
                                quan = quan + parseInt(menuN[0]);
                                arrqty[index] = quan;
                            }
                        }
                    }
                }

                var initialQty = 0;
                var highestIndex;
                for (let i = 0; i < arrqty.length; i++)
                {
                    if (initialQty < arrqty[i])
                    {
                        initialQty = arrqty[i];
                        highestIndex = i;
                    }
                }
                
                dataRes = arr[highestIndex];
                dataQuan = arrqty[highestIndex];

                return callback(dataRes, dataQuan);

            } 
            else {
                return callback("None", 0);
            }
        })
    }

    GetPreferredDishesPerWeek(datePerWeek, callback){
        let sql = "SELECT * FROM orders where orderdate between date_sub('" + datePerWeek + "',INTERVAL 1 WEEK) and '" + datePerWeek + "';";
        const arr = [];
        const arrqty = [];

        con.query(sql, function(err, results){
            if (err){ 
                throw err;       
            }

            var dataRes;
            var dataQuan;

            if(results.length>0) { //result is not empty
                

                for (let i = 0; i < results.length; i++)
                {
                    var menu = results[i].menuList.split(', ');
                    
                    for (let j = 0; j < menu.length; j++)
                    {
                        if (menu[j] !== '')
                        {
                            var menuN = menu[j].split('_');
                            if (arr.indexOf(menuN[1]) === -1)
                            {
                                arr.push(menuN[1]);
                                arrqty.push(parseInt(menuN[0]));
                            } 
                            else
                            {
                                var index = arr.indexOf(menuN[1]);
                                var quan = arrqty[index];
                                quan = quan + parseInt(menuN[0]);
                                arrqty[index] = quan;
                            }
                        }
                    }
                }

                var initialQty = 0;
                var highestIndex;
                for (let i = 0; i < arrqty.length; i++)
                {
                    if (initialQty < arrqty[i])
                    {
                        initialQty = arrqty[i];
                        highestIndex = i;
                    }
                }
                
                dataRes = arr[highestIndex];
                dataQuan = arrqty[highestIndex];

                return callback(dataRes, dataQuan);

            } 
            else {
                return callback("None", 0);
            }
        })
    }

    GetPreferredDishesPerMonth(datePerMonth, callback){
        let sql = "SELECT * FROM orders where orderdate between date_sub('" + datePerMonth + "',INTERVAL 1 MONTH) and '" + datePerMonth + "';";
        const arr = [];
        const arrqty = [];

        con.query(sql, function(err, results){
            if (err){ 
                throw err;       
            }

            var dataRes;
            var dataQuan;

            if(results.length>0) { //result is not empty
                

                for (let i = 0; i < results.length; i++)
                {
                    var menu = results[i].menuList.split(', ');
                    
                    for (let j = 0; j < menu.length; j++)
                    {
                        if (menu[j] !== '')
                        {
                            var menuN = menu[j].split('_');
                            if (arr.indexOf(menuN[1]) === -1)
                            {
                                arr.push(menuN[1]);
                                arrqty.push(parseInt(menuN[0]));
                            } 
                            else
                            {
                                var index = arr.indexOf(menuN[1]);
                                var quan = arrqty[index];
                                quan = quan + parseInt(menuN[0]);
                                arrqty[index] = quan;
                            }
                        }
                    }
                }

                var initialQty = 0;
                var highestIndex;
                for (let i = 0; i < arrqty.length; i++)
                {
                    if (initialQty < arrqty[i])
                    {
                        initialQty = arrqty[i];
                        highestIndex = i;
                    }
                }
                
                dataRes = arr[highestIndex];
                dataQuan = arrqty[highestIndex];

                return callback(dataRes, dataQuan);

            } 
            else {
                return callback("None", 0);
            }
        })
    }
}

exports.Order = Order