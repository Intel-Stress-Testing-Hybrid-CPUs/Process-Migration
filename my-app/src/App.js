import logo from './logo.svg';
import './App.css';
import Script from './component/Script';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />

      </header>
      <body>
        <Script />
      </body>
    </div>
  );
}

export default App;
