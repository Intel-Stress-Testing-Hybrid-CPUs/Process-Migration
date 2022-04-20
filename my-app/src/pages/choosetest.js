import React, {useState, useEffect} from 'react'
import useScript from '../hooks/useScript'

function Choosetest() {

    //const VtuneScript = useScript('../../../vtune/vtune-script.ps1')

    const [loaded, setloaded] = useState(false);

    const [Name, setName] = useState(()=> {
        console.log('run inital Test')
        return 'None' 
    }) 

    // const [Script, setScript] = useState(() => {    // Empty Script until they choose a test.
    //     console.log('Init empty Script')
    //     return 0
    // })


    function runVtune() {   // Add Script to this....
        setCurrent(prevName => 'Vtune')
        //useScript('../../../vtune/vtune-script.ps1')  //Figuring out URL/access...
    }

    useEffect(() => {
        console.log('useEffect')
        if(!loaded) return;

    }, [loaded])

    return (
        <div
            style={{
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
                height: '100vh'
            }}
        >
           <p>'Current test selected: ${VtuneScript}$'</p> 
           <div>
            <h1> {NameOfTest} Test</h1>
            <button className="script" onClick={runVtune()}>
                {loaded ? 'Test Ready' : 'Test not Ready'}
            </button>
            </div>
        </div>
        
    );
};

export default Choosetest;

