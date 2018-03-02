import React from "react";
import PropTypes from "prop-types";
import moment from "moment";

import CalendarDay from "./CalendarDay";

export default class Calendar extends React.Component {
  constructor(props) {
    super(props);
    this.startOfWeek = moment().startOf('isoWeek');
  }

  render() {
    return (
      <div>
        {this.computeWeekDays()}
      </div>
    );
  }

  computeWeekDays() {
    let weekDays = [];
    for (let dayNumber=0; dayNumber<7; dayNumber++) {
      const currentDate = moment(this.startOfWeek).add(dayNumber, 'd');
      const events = this.props.events.filter(event => (
        currentDate.isBetween(event.attributes.startDate, event.attributes.endDate, 'day', '[]')
      ));
      weekDays.push(
        <CalendarDay key={currentDate.unix()} date={currentDate} events={events}/>
      );
    }
    return weekDays;
  }
}



Calendar.defaultProps = {
  events: [],
};

Calendar.propTypes = {
  events: CalendarDay.propTypes.events,
};
