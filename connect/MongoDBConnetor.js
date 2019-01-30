const mongoose = require('mongoose');
const url = "mongodb://root:root903226@ds111025.mlab.com:11025/mlab-mongodb-01";
mongoose.connect(url, {
    useNewUrlParser: true
});
mongoose.Promise = global.Promise;
const db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));
db.once('open', function () {
    console.log("Connect to mongoDB successfully!");
})

const ordersSchema = new mongoose.Schema({
    CustomerID: String,
    SalesOrderID: String,
    OrderDate: String,
    OrderAmount: String
});

const orders = mongoose.model('orders', ordersSchema);
const oneOrder = new orders({
    CustomerID: '30072'
});
let sumMap = new Map();
let countMap = new Map();
orders.find(function (err, result) {
    if (err) return console.error(err);
    for (let i = 0; i < result.length; i++) {
        if (sumMap.get(result[i].CustomerID) === undefined) {
            sumMap.set(result[i].CustomerID, 0);
            countMap.set(result[i].CustomerID, 0);
        }
        sumMap.set(result[i].CustomerID, sumMap.get(result[i].CustomerID) + Number(result[i].OrderAmount));
        countMap.set(result[i].CustomerID, countMap.get(result[i].CustomerID) + 1);
    }
    for (let customer of sumMap) {
        let ave = customer[1] / countMap.get(customer[0]);
        console.log("Customer " + customer[0] + " Average order amount: " + ave);
    }
})