import React from "react";
import autoBind from 'react-autobind';
import PropTypes from "prop-types";

import NewEventForm from './NewEventForm';

export default class CreateEventLink extends React.Component {
  constructor(props) {
    super(props);
    autoBind(this);
    this.state = {
      isFormOpen: false,
    };
  }

  render() {
    if (this.state.isFormOpen) {
      return <NewEventForm handleSubmit={this.handleFormSubmit}/>;
    } else {
      return <a href="#" onClick={this.openForm}>Create event</a>;
    }
  }

  openForm() {
    this.setState({
      isFormOpen: true,
    });
  }

  handleFormSubmit(event) {
    this.setState({
      isFormOpen: false,
    });
    this.props.handleEventCreated(event);
  }
}

CreateEventLink.propTypes = {
  handleEventCreated: PropTypes.func,
};
