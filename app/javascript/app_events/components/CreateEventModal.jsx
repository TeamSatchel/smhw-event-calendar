import React from "react";

export default class CreateEventModal extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      startDate: props.startDate.toISOString().slice(0, 10),
      description: "",
      lengthDays: 1,
      lengthDaysLabel: "day"
    };
  }

  render() {
    return (
      <div className="create-event-modal">
        <h3>Add a new Event</h3>
        <label htmlFor="date" className="date-field-label">
          Starts on:
        </label>
        <input
          className="date-field"
          type="date"
          id="date"
          value={this.state.startDate}
          onChange={this.updateStartDate.bind(this)}
        />
        <br />
        <input
          className="length-days-field"
          type="number"
          id="length-days"
          value={this.state.lengthDays}
          onChange={this.updateLengthDays.bind(this)}
          min="1"
        />
        <label htmlFor="length-days" className="description-field-label">
          {this.state.lengthDaysLabel}
        </label>
        <input
          className="description-field"
          type="text"
          value={this.state.description}
          onChange={this.updateDescription.bind(this)}
          placeholder="Enter description..."
        />
        <button
          className="create-event-button"
          onClick={this._createEvent.bind(this)}
        >
          Create
        </button>
      </div>
    );
  }

  updateDescription(event) {
    this.setState({
      description: event.target.value
    });
  }

  updateStartDate(event) {
    this.setState({
      startDate: event.target.value
    });
  }

  updateLengthDays(event) {
    this.setState({
      lengthDays: event.target.value,
      lengthDaysLabel: this._lengthDaysLabelFor(event.target.value)
    });
  }

  _lengthDaysLabelFor(length) {
    var label = "day";

    if (length > 1) {
      label += "s";
    }

    return label;
  }

  _createEvent() {
    this.props.createEvent(
      this.state.startDate,
      this.state.description,
      this.state.lengthDays
    );
  }
}
