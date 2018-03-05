import React from "react";
import PropTypes from "prop-types";

import DayHeader from "./DayHeader";
import DayBody from "./DayBody";

import '../src/calendar-day.sass';

export default class CalendarDay extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div className="day-wrapper">
        <DayHeader date={this.props.date}/>
        <DayBody events={this.props.events} date={this.props.date}/>
      </div>
    );
  }
}

CalendarDay.propTypes = {
  events: DayBody.propTypes.events.isRequired,
  date: PropTypes.object.isRequired,
};
