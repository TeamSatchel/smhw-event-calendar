import React from "react";
import autoBind from 'react-autobind';

import CreateEventLink from "./CreateEventLink";
import Calendar from "./Calendar";

export default class CalendarDashboard extends React.Component {
  constructor(props) {
    super(props);
    autoBind(this);
    this.state = {
      events: [],
    };
  }

  render() {
    return (
      <div>
        <h1>Events calendar</h1>
        <CreateEventLink />
        <Calendar events={this.state.events} />
      </div>
    );
  }
}
