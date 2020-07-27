var connection = require('../config');
module.exports.authenticate=function(req,res){
    var name=req.body.name;
    var password=req.body.password;
    connection.query('SELECT * FROM admin WHERE name = ?',[name], function (error, results, fields) {
      if (error) {
          res.json({
            status:"erro",
            message:"there are some error with query"
            })
      }else{
        if(results.length >0){
            if(password==results[0].password){
                res.json({
                  
                    status:1,
                    message:"successfully authenticated",
                   
                })
            }else{
                res.json({
                  status:2,
                  message:"Email and password does not match"
                 });
            }
         
        }
        else{
          res.json({
              status:3,    
            message:"Email does not exits"
          });
        }
      }
    });
}