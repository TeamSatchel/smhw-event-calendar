import React from "react"
import PropTypes from "prop-types"
import Modal from 'react-responsive-modal'
import axios from 'axios'
import moment from 'moment'
import { passCsrfToken } from '../../util/helpers'
import './eventCreator.scss'

class EventCreator extends React.Component {
  constructor(props) {
    super( props );
    this.onOpenModal = this.onOpenModal.bind(this);
    this.onCloseModal = this.onCloseModal.bind(this);
    this.state = this._resetStateValues();

    this.handleInputChange = this.handleInputChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidMount() {
    passCsrfToken(document, axios);
  }

  onOpenModal() {
    this.setState({ showModal: true });
  };

  onCloseModal() {
    this.setState(this._resetStateValues());
  };

  handleInputChange() {
    const target = event.target;
    const name = target.name;

    this.setState({
      [name]: target.value
    });
  }

  handleSubmit(event) {
    event.preventDefault();
    axios.post('/events', {
      title: this.state.eventTitle,
      description: this.state.eventDescr,
      start_date: moment(this.state.eventStartDate).toDate(),
      end_date: moment(this.state.eventEndDate).toDate(),
      calendar_id: this.state.calendarValue
    })
    .then(response => {
      this.setState(this._resetStateValues());
      this.props.onCreateEvent(response.data.event);
    })
    .catch(error => {
      this.setState({eventErrors: error.response.data.errors})
    });
  }

  _resetStateValues(){
    return {
      showModal: false,
      eventTitle: '',
      eventDescr: '',
      eventStartDate: this._formatedCurrentDateTime(),
      eventEndDate: this._formatedCurrentDateTime(30),
      calendarValue: '',
      eventErrors: ''
    };
  }

  _formatedCurrentDateTime(aditionalMinutes) {
    const currentDate = new Date();
    if (aditionalMinutes && typeof(aditionalMinutes) == 'number'){
      currentDate.setMinutes(currentDate.getMinutes() + aditionalMinutes);
    }
    return currentDate.getFullYear() + "-" +
             this._prependZeroToStart(currentDate.getMonth() + 1) + "-" +
             this._prependZeroToStart(currentDate.getDate()) + "T" +
             this._prependZeroToStart(currentDate.getHours()) + ":" +
             this._prependZeroToStart(currentDate.getMinutes());
  }

  _prependZeroToStart(val) {
    return val.toString().padStart(2, 0);
  }

  render () {
    let calendarOptions = this.props.calendars.map(v => (
      <option key={v.id} value={v.id}>{v.name}</option>
    ));

    let eventErrorsLabel
    if (this.state.eventErrors.length > 0){
      eventErrorsLabel = React.createElement('label', {className: 'error-label' }, this.state.eventErrors);
    }

    return (
      <React.Fragment>
        <a name="create-event" onClick={ this.onOpenModal } >Create event</a>
        <Modal open={this.state.showModal} onClose={this.onCloseModal} center>
          {eventErrorsLabel}
          <br/>
          <form onSubmit={this.handleSubmit} >
            <label>
              Calendar:
              <select name="calendarValue"
                value={this.state.calendarValue}
                onChange={this.handleInputChange}
              >
                <option disabled value="">Please select calendar</option>
                {calendarOptions}
              </select>
            </label>
            <br/>
            <label>
              Title:
              <input name="eventTitle"
                value={this.state.eventTitle}
                onChange={this.handleInputChange}
              />
            </label>
            <br/>
            <label>
              Description:
              <input name="eventDescr"
                value={this.state.eventDescr}
                onChange={this.handleInputChange}
              />
            </label>
            <br/>
            <label>
              Start Date:
              <input name="eventStartDate"
                type='datetime-local'
                value={this.state.eventStartDate}
                onChange={this.handleInputChange}
              />
            </label>
            <br/>
            <label>
              End Date:
              <input name="eventEndDate"
                type='datetime-local'
                value={this.state.eventEndDate}
                onChange={this.handleInputChange}
              />
            </label>
            <br/>
            <input type="submit" />
          </form>
        </Modal>
      </React.Fragment>
    );
  }
}

export default EventCreator
