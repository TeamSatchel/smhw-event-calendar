import React from "react";
import PropTypes from "prop-types";

import DayHeader from "./DayHeader";
import DayBody from "./DayBody";

export default class CalendarDay extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <DayHeader date={this.props.date}/>
        <DayBody />
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

CalendarDay.propTypes = {
  events: PropTypes.arrayOf(eventType).isRequired,
};
