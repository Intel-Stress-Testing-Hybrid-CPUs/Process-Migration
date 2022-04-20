import React, {useState, useEffect} from 'react'
import useScript from '../hooks/useScript'

function Choosetest() {

    const VtuneScript = props => {
            useScript('../../../vtune/vtune-script.ps1');       // Mount this somehow.
    }

    //const [loaded, setloaded] = useState(false);

    // const [Name, setName] = useState(()=> {
    //     console.log('run inital Test')
    //     return 'None' 
    // }) 

    // const [Script, setScript] = useState(() => {    // Empty Script until they choose a test.
    //     console.log('Init empty Script')
    //     return 0
    // })


    function runVtune() {   // Add Script to this....
        console.log('button click')
        //setName(prevName => 'Vtune')
        //useScript(VtuneScript)  //Figuring out URL/access...
        //setloaded(loaded => true)
    }


    return (
        <div
            style={{
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
                height: '100vh'
            }}
        >
           <h2>'Current test selected: Vtune'</h2> 
           <span></span>
            <button onClick={runVtune}>
                Hello
            </button>
        </div>
        
    );
};
//{loaded ? 'Test Ready' : 'Test not Ready'}
export default Choosetest;

