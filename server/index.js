const express = require('express');
const bodyParser = require('body-parser');

let db = null;

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));

var authenticateController=require('./controllers/authenticate-controller');
var registerController=require('./controllers/register-controller');

app.post('/api/register',registerController.register);
app.post('/api/authenticate',authenticateController.authenticate);


// app.post('/admin', async(req, res, next)=>{
//     const name = req.body.name;
//     const password = req.body.password;
//     var result = await db.query("SELECT * FROM  admin where name = ? AND password = ?;",[name,password]);
//     if (result > 0 ){
//         res.json({status:"ok"});
//         res.json(result);
//     }
    
    
//     next();
// })
   
        app.listen(8000);
    
