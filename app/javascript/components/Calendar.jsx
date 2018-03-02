import React from "react";
import PropTypes from "prop-types";
import moment from "moment";

import CalendarDay from "./CalendarDay";

export default class Calendar extends React.Component {
  constructor(props) {
    super(props);
    let startOfWeek = moment().startOf('isoWeek');
    this.weekDays = [];
    for (let dayNumber=0; dayNumber<7; dayNumber++) {
      let currentDate = moment(startOfWeek).add(dayNumber, 'd');
      console.log(startOfWeek);
      this.weekDays.push(<CalendarDay key={currentDate.unix()} date={currentDate}/>);
    }
  }

  render() {
    return (
      <div>
        {this.weekDays}
      </div>
    );
  }
}

const eventType = PropTypes.shape({
  id: PropTypes.number.isRequired,
  startDate: PropTypes.number.isRequired,
  endDate: PropTypes.number.isRequired,
  description: PropTypes.string,
});

Calendar.defaultProps = {
  events: [],
};

Calendar.propTypes = {
  events: PropTypes.arrayOf(eventType),
};
