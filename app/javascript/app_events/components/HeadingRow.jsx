import React from "react";
import HeadingCell from "./HeadingCell";

export default class HeadingRow extends React.Component {
  render() {
    return (
      <tr className="heading-row">
        {this.props.displayDates.map(function(date, i) {
          return (
            <HeadingCell
              key={i}
              weekend={date.weekend}
              today={date.today}
              dayName={date.name}
              dayWithMonth={date.day_with_month}
            />
          );
        })}
      </tr>
    );
  }
}
