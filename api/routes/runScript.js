var express = require("express");
var router = express.Router();

const { exec } = require('child_process');
exec('../../vtune/vtune-script.ps1', {'shell':'powershell.exe'}, (error, stdout, stderr)=> {
    // do whatever with stdout
})

router.get("/choosetest", function(req, res, next) {
    res.send("Test ran");
});

module.exports = router;