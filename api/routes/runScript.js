var express = require("express");
var router = express.Router();

// const { exec } = require('child_process');
// exec('../../vtune/vtune-script.ps1', {'shell':'powershell.exe'}, (error, stdout, stderr)=> {
//     // do whatever with stdout
// })

var spawn = require("child_process").spawn,child;
child = spawn("powershell.exe",["C:\Users\AndrewVu\Documents\GitHub\Process-Migration\vtune\vtune-script.ps1"]);
child.stdout.on("data",function(data){
    console.log("Powershell Data: " + data);
});
child.stderr.on("data",function(data){
    console.log("Powershell Errors: " + data);
});
child.on("exit",function(){
    console.log("Powershell Script finished");
});
child.stdin.end(); //end input


router.get("/", function(req, res, next) {
    res.send("Test ran");
});

module.exports = router;