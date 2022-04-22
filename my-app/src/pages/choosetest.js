import React, {useState, useEffect} from 'react'
import './choosetest.css';

class Choosetest extends React.Component {
    constructor(props){
        super(props);
        this.state={apiResponse: ""};
        this._buttonClick = this._buttonClick.bind(this);
    }

    callScript(){
        console.log('starting to call Script')
        fetch("http://localhost:9000/runScript")
        .then(res => res.text())
        .then(res => this.setState({apiResponse: res}));
        console.log('called Script')
    }

    _buttonClick() {
        console.log('clicked');
        this.callScript();
    }

    // button1.clicked(){
    //     console.log('button clicked');
    //     $.ajax({url: 'test1', success:function(res){
    //         console.log('server response is', res);
    //     }});
    // });

    render(){
        return (
            <body>
                <div>
               <h2>Current Test Selected: Vtune</h2> 
               <span></span>
               <p>
                Our software utilizes Intel's VTune Profiler, which is a performance analysis tool used for analyzing multithreaded execution on multicore systems. 
    
                Our testing framework is designed as follows:
                VTune script runs Intel Vtune analysis on a chosen test
                Process Migration script then takes this test and performs various forms of process migration during the running of the test.
                A logging executable then records changes in processor affinity of the running test as it is migrated between cores. 
                Once the test finishes, the logging output and VTune results are then recorded.
    
                VTune results between a homogenous core and hybrid core system can then be used to highlight areas of processor execution where potential hybrid bugs could occur.
                </p>
                <button>
                    Choose A Different Test
                </button>
                <button id='buttonRun' onClick={this._buttonClick}>
                    Run Vtune
                </button>
                </div>
            </body>
        );
    }
}

//{loaded ? 'Test Ready' : 'Test not Ready'}
export default Choosetest;

