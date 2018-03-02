import React from "react";
import PropTypes from "prop-types";

export default class Calendar extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <p>{this.props.date.format()}</p>
      </div>
    );
  }
}

Calendar.propTypes = {
  date: PropTypes.object.isRequired,
};
