import React from "react";
import DateChanger from "./DateChanger";
import CreateEventModal from "./CreateEventModal";

export default class Controls extends React.Component {
  render() {
    return (
      <div className="controls">
        <div className="date-changer-holder">
          <DateChanger
            direction="back"
            updateDates={this.props.updateDates}
            newStartDate={this.props.previousDate}
          />
          <DateChanger
            direction="forward"
            updateDates={this.props.updateDates}
            newStartDate={this.props.nextDate}
          />
        </div>
        <CreateEventModal
          createEvent={this.props.createEvent}
          startDate={this.props.startDate}
        />
      </div>
    );
  }
}
