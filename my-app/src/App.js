//import logo from './logo.svg';
import './App.css';
import Navbar from "./components/Navbar";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from './pages';
import About from './pages/about';
import Choosetest from './pages/choosetest';

function App() {  // Add classnames to headers and such once more complex. Also will add layout.
  return (
    <Router>
      <Navbar />
      <Routes>
        <Route exact path="/" element={<Home/>} />
        <Route exact path="/about" element={<About/>} />
        <Route exact path="/choosetest" element={<Choosetest/>} />
      </Routes>
    </Router>
    //   <header className="App-header">
    //     <img src={logo} className="App-logo" alt="logo" />
    //   </header>
  );
}
// Extra can add handle Resize
export default App;
