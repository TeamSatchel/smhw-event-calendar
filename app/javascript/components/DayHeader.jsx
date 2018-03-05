import React from "react";
import PropTypes from "prop-types";

import '../src/day-header.sass';

export default class DayHeader extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div className="day-header">
        <span>{this.props.date.format('dddd')}</span>
        <span>{this.props.date.format('Do MMM')}</span>
      </div>
    );
  }
}

DayHeader.propTypes = {
  date: PropTypes.object.isRequired,
};
