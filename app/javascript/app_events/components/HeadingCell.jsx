import React from "react";

export default class HeadingCell extends React.Component {
  render() {
    return (
      <th className={this._classNameString()}>
        <p>{this.props.dayName}</p>
        <p>{this.props.dayWithMonth}</p>
      </th>
    );
  }

  _classNameString() {
    var s = "date-container";

    if (this.props.weekend) {
      s += " weekend";
    }

    if (this.props.today) {
      s += " today";
    }

    return s;
  }
}
