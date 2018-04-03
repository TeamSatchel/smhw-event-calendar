import React from "react";

export default class DateChanger extends React.Component {
  render() {
    return (
      <button
        className={`date-changer ${this.props.direction}-date-changer`}
        onClick={this._updateDates.bind(this)}
      />
    );
  }

  _updateDates() {
    this.props.updateDates(this.props.newStartDate);
  }
}
