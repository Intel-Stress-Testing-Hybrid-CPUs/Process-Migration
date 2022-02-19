import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);

class Script extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      value: null,    
      isRunning: false    // Is script currently running?
    };
  }

  handleClick(i) {
    // Set state isRunning True
    this.setState(isRunning = True)
    // Execa. Grab script and run
    execa('echo', "hello")
  }

  // Runs script. Re-renders when button is pressed.
  render() {
    return (
      <button className="script"
        onClick={
          () => console.log('click') ,
          () => this.setState({value: 'Ongoing'})}
      >
      {this.props.value}
      </button>
    )
  }
}


// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
