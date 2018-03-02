import React from "react";
import autoBind from 'react-autobind';
import DatePicker from 'react-datepicker';
import moment from 'moment';

import 'react-datepicker/dist/react-datepicker.css';

export default class NewEventForm extends React.Component {
  constructor(props) {
    super(props);
    autoBind(this);
    this.state = {
      startDate: moment(),
      endDate: moment(),
      description: '',
    };
  }

  render() {
    return (
      <div>
        <label>Start Date</label>
        <DatePicker
          selected={this.state.startDate}
          onChange={this.handleStartDateChange}
        />
        <label>End Date</label>
        <DatePicker
          selected={this.state.endDate}
          onChange={this.handleEndDateChange}
        />
        <label>Description</label>
        <textarea value={this.state.description} onChange={this.handleDescriptionChange}></textarea>
        <button onClick={this.createEvent}>Create event</button>
      </div>
    );
  }

  updateState(name, value) {
    this.setState({
      ...this.state,
      [name]: value,
    })
  }

  handleStartDateChange(date) {
    this.updateState('startDate', date);
  }

  handleEndDateChange(date) {
    this.updateState('endDate', date);
  }

  handleDescriptionChange(e) {
    this.updateState('description', e.target.value);
  }

  createEvent() {
  }
}
