import React from "react";
import EventCell from "./EventCell";

export default class EventRow extends React.Component {
  render() {
    var count = 0;

    return (
      <tr className="event-row">
        {this.props.dates.map((date, i) => {
          var scheduled = this._shouldDisplayEventOnDate(date.date);
          var first;

          if (scheduled) {
            first = count === 0;
            count++;
          }

          return (
            <EventCell
              key={i}
              scheduled={scheduled}
              first={first}
              text={this.props.description}
            />
          );
        })}
      </tr>
    );
  }

  _shouldDisplayEventOnDate(date) {
    return (
      this.props.startDate === date ||
      this.props.endDate === date ||
      (this.props.startDate < date && this.props.endDate > date)
    );
  }
}
