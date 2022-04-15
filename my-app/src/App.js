//import logo from './logo.svg';
import './App.css';
//import Script from './component/Script';
import Navbar from "./components/Navbar";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from './pages';
import About from './pages/about';
import Choosetest from './pages/choosetest';

function App() {
  return (
    <Router>
      <Navbar />
      <Routes>
        <Route exact path="/" element={<Home/>} />
        <Route exact path="/about" element={<About/>} />
        <Route exact path="/choosetest" element={<Choosetest/>} />
      </Routes>
    </Router>
    // <div className="App">
    //   <header className="App-header">
    //     <img src={logo} className="App-logo" alt="logo" />

    //   </header>
    //   <body>
    //     <Script />
    //   </body>
    // </div>
  );
}

export default App;
