import React from "react";
import axios from "axios";
import Calendar from "./Calendar";
import Controls from "./Controls";
import MessageBar from "./MessageBar";

const TODAY = new Date();

class EventsDisplay extends React.Component {
  constructor() {
    super();
    this.state = {
      events: [],
      displayDates: [],
      previousDate: null,
      nextDate: null
    };
  }

  fetchEvents(newStartDate) {
    this.startDate = newStartDate;

    axios
      .get(`api/events?start_date=${this.startDate}`)
      .then(response => {
        this.setState({
          events: response.data["events"],
          displayDates: response.data["display_dates"],
          previousDate: response.data["previous_date"],
          nextDate: response.data["next_date"]
        });

        console.log(response);
      })
      .catch(error => {
        this.messageBar.update(error.message, true);

        console.error(error);
      });
  }

  createEvent(startDate, description, lengthDays) {
    axios
      .post(
        `api/events?event[start_date]=${startDate}&event[description]=${description}&event[length_days]=${lengthDays}`
      )
      .then(response => {
        this.fetchEvents(startDate);
        this.messageBar.update(response.data.message);
      })
      .catch(error => {
        this.messageBar.update(error.message, true);
      });
  }

  componentDidMount() {
    this.fetchEvents(TODAY);
  }

  render() {
    return (
      <div>
        <Calendar
          displayDates={this.state.displayDates}
          events={this.state.events}
          today={TODAY}
        />
        <Controls
          previousDate={this.state.previousDate}
          nextDate={this.state.nextDate}
          updateDates={this.fetchEvents.bind(this)}
          createEvent={this.createEvent.bind(this)}
          startDate={TODAY}
        />
        <MessageBar ref={ref => (this.messageBar = ref)} />
      </div>
    );
  }
}

export default EventsDisplay;
