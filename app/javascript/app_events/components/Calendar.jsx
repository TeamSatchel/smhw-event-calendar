import React from "react";
import HeadingsRow from "./HeadingRow";
import EventRow from "./EventRow";

export default class Calendar extends React.Component {
  render() {
    return (
      <table className="calendar">
        <tbody>
          <HeadingsRow displayDates={this.props.displayDates} />

          {this.props.events.map((event, i) => {
            return (
              <EventRow
                key={i}
                description={event.description}
                startDate={event.start_date}
                endDate={event.end_date}
                dates={this.props.displayDates}
              />
            );
          })}
        </tbody>
      </table>
    );
  }
}
