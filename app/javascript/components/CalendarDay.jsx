import React from "react";
import PropTypes from "prop-types";

import DayHeader from "./DayHeader";
import DayBody from "./DayBody";

export default class Calendar extends React.Component {
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

Calendar.propTypes = {
  date: PropTypes.object.isRequired,
};
