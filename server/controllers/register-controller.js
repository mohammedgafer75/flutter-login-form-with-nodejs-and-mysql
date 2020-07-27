var connection = require('../config');
module.exports.register=function(req,res){
    var users={
        "name":req.body.name,
        "password":req.body.password,
    }
    connection.query('INSERT INTO admin SET ?',users, function (error, results, fields) {
      if (error) {
        res.json({
            status:false,
            message:'there are some error with query'
        })
      }else{
          res.json({
            status:true,
            data:results,
            message:'user registered sucessfully'
        })
      }
    });
}