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
      // pass events that correspond to current date
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
  id: PropTypes.string.isRequired,
  attributes: PropTypes.shape({
    startDate: PropTypes.string.isRequired,
    endDate: PropTypes.string.isRequired,
    description: PropTypes.string,
  })
});

Calendar.defaultProps = {
  events: [],
};

Calendar.propTypes = {
  events: PropTypes.arrayOf(eventType),
};
