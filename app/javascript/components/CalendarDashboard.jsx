import React from "react";
import autoBind from 'react-autobind';

import CreateEventLink from "./CreateEventLink";
import Calendar from "./Calendar";
import EventsAxios from "../utils/events_axios";

export default class CalendarDashboard extends React.Component {
  constructor(props) {
    super(props);
    autoBind(this);
    this.state = {
      events: [],
    };
  }

  componentDidMount() {
    EventsAxios.getIndex().then(res => {
      this.setState({ events: res.data.data });
    });
  }

  render() {
    return (
      <div>
        <h1>Events calendar</h1>
        <CreateEventLink handleEventCreated={this.addEvent}/>
        <Calendar events={this.state.events}/>
      </div>
    );
  }

  addEvent(event) {
    this.setState({ events: [...this.state.events, event] });
  }
}
