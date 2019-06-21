import React from "react"
import FullCalendar from '@fullcalendar/react'
import jQuery from 'jquery'
import dayGridPlugin from '@fullcalendar/daygrid'
import interactionPlugin from '@fullcalendar/interaction'
import PropTypes from "prop-types"
import EventCreator from '../event_creator/EventCreator.js'

import './calendar.scss'

class Calendar extends React.Component {
  calendarRef = React.createRef()

  constructor(props) {
    super( props );
    this.handleEventAdding = this.handleEventAdding.bind(this);
    this.state = { events: props.events, calendars: props.calendars };
  }

  handleEventAdding(newEvent) {
    this.setState(previousState => ({ events: [...previousState.events, newEvent] }));
  }

  renderEvent(el){
    jQuery(el.el).find('.fc-content').append('<span class="fc-description">'+
                                                el.event.extendedProps.description +
                                             '</span>');
  }

  render () {
    return (
      <React.Fragment>
        <EventCreator onCreateEvent={this.handleEventAdding}
          events={this.state.events}
          calendars={this.state.calendars}
        />

        <FullCalendar
          timeZone='local'
          defaultView="dayGridWeek"
          plugins={[ dayGridPlugin, interactionPlugin ]}
          events={this.state.events}
          eventRender={this.renderEvent}
          displayEventEnd='true'
        />

      </React.Fragment>
    );
  }
}

Calendar.propTypes = {
  events: PropTypes.array,
  calendars: PropTypes.array
};
export default Calendar
