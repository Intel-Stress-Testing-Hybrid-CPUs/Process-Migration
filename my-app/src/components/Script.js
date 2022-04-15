import React from "react";
//import {useState} from 'react';

function Script(props){
    //const [ShowLog, setLog] = useState(false) // Current State, Function to Change

    // Having Trouble w/ Execa b/c import not working
    // async function exe(file, [...args]) {
    //     const {execa} = await import("execa");

    //     try {       //Should Run Script and display error if something goes wrong.
    //         const {stdout , stdeer} = await execa(file, [...args]);
    //         console.log({stdout,stdeer});
    //         return stdout;
    //     } catch (error) {
    //         console.error('Failed to run. stdeer: ${error.stdeer} (${error.exitCode})');
    //     }
    //     return "Failed";
    // }


    function handleClick() {
        console.log('Click');
        //exe('./' ,['C:\Users\AndrewVu\Documents\GitHub\Process-Migration\process-migrate-script.ps1']);

        

        // Read Names from a Folder
        /*
        //const fs = require('fs')

        //const dir = '/Desktop/folder'  // Want to put this here to be consistent
        //const files = fs.readdirSync(dir)

        //for(const file of files) {
        //    exe("./", file);        // Store result somehow.
        //}
        */
    }

    return (
        <div>
            <h1> Press this button to run Script</h1>
            <button className="script" onClick={ handleClick}>
                Run
            </button>
        </div>
      )
}


export default Script;