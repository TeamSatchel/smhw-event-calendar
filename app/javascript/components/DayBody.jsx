import React from "react";
import PropTypes from "prop-types";
import moment from "moment";

import '../src/day-body.sass';

export default class DayBody extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div className="day-body">
        { this.props.events.map((event, index) => {
          return this.renderEventRow(event, index);
        })}
      </div>
    );
  }

  renderEventRow(event, i) {
    if (event) {
      let description = null;
      let classNames = "day-event";
      if (this.props.date.isSame(moment(event.attributes.startDate))) {
        description = (
          <div className="description">
            {event.attributes.description}
          </div>
        );
        classNames += " first-day";
      }
      if (this.props.date.isSame(moment(event.attributes.endDate))) {
        classNames += " last-day";
      }
      return <div className={classNames} key={event.id}>
        {description}
      </div>;
    } else {
      return (<div key={i} className="no-event"></div>);
    }
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


DayBody.propTypes = {
  events: PropTypes.arrayOf(eventType),
  date: PropTypes.object.isRequired,
};
