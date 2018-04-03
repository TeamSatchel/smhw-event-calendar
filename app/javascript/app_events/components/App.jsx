import React from "react";
import { BrowserRouter as Router, Route } from "react-router-dom";
import EventsDisplay from "./EventsDisplay";

const App = props => (
  <Router>
    <div>
      <Route path="/" component={EventsDisplay} />
    </div>
  </Router>
);

export default App;
