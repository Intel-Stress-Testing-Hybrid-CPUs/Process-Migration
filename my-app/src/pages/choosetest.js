import React, {useState, useEffect} from 'react'
import './choosetest.css';

class Choosetest extends React.Component {
    constructor(props){
        super(props);
        this.state={apiResponse: ""}
    }

    callScript(){
        fetch("http://localhost:9000/runScript")
        .then(res => res.text())
        .then(res => this.setState({apiResponse: res}));
    }

    componentWillMount(){
        this.callScript();
    }


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
                <button onClick={this.componentWillMount()}>
                    Run Vtune
                </button>
                <p>
                    {this.state.apiResponse}
                </p>
                </div>
            </body>
        );
    }
}

//{loaded ? 'Test Ready' : 'Test not Ready'}
export default Choosetest;