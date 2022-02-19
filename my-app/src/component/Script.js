import React from "react";
import {useState} from 'react';

function Script(props){
    //const [ShowLog, setLog] = useState(false) // Current State, Function to Change

    function handleClick() {
        console.log('Click');

        // Set state isRunning True
        //this.setState(value = true)
        // Execa. Grab script and run
        //execa('echo', "hello")
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
// class Script extends React.Component {
//     constructor(props){
//       super(props);
//       this.state = {
//         value: null,    
//         //isRunning: false    // Is script currently running?
//       };
//     }
  
//     // Runs script. Re-renders when button is pressed.
//     render() {
//       return (
//         <button className="script"
//           onClick={
//             () => console.log('click') ,
//             () => this.setState({value: 'Ongoing'})}
//         >
//         {this.props.value}
//         </button>
//       )
//     }
//   }

export default Script;