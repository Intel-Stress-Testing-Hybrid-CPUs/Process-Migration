import logo from './logo.svg';
import './App.css';
import './index.js';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />

      </header>
      <body>
        <Script 
          onClick = {i => this.handleClick(i)}
        
        />
      </body>
    </div>
  );
}

export default App;
