import React from "react";

export default class EventCell extends React.Component {
  render() {
    return (
      <td>
        <div className={this._classNameString()}>{this._displayText()}</div>
      </td>
    );
  }

  _displayText() {
    var text = "";

    if (this.props.scheduled && this.props.first) {
      text = this.props.text;
    }

    return text;
  }

  _classNameString() {
    var s = "";

    if (this.props.scheduled) {
      s += "scheduled-event";
    }

    if (this.props.first) {
      s += " first-scheduled-event";
    }

    return s;
  }
}
