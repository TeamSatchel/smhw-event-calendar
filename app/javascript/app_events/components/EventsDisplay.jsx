import React from 'react';
import { Link } from 'react-router-dom';
import queryString from 'query-string';
import axios from 'axios';

class EventsDisplay extends React.Component {
  constructor () {
    super();
    this.state = {
      events: [],
      display_dates: [],
      previous_date: '',
      next_date: ''
    };
  }

  fetchEvents (startDate) {
    axios.get( `api/events?start_date=${startDate}` )
      .then(response => {
        this.setState(
                       { 
                         events: response.data['events'],
                         display_dates: response.data['display_dates'],
                         previous_date: response.data['previous_date'],
                         next_date: response.data['next_date']
                       }
                      );
      })
      .catch(error => {
        console.error(error);
      });
  }

  setStartDateFromQueryString (qs) {
    this.qsParams = queryString.parse(qs);
    if (this.qsParams.start_date) {
      this.startDate = this.qsParams.start_date;
    } else {
      this.startDate = new Date();
    }
  }

  componentDidMount () {
    this.startDate = new Date();
    this.fetchEvents(this.startDate);
  }

  componentWillReceiveProps (nextProps) {
    this.setStartDateFromQueryString(nextProps.location.search);
    this.fetchEvents(this.startDate);
  }

  render () {
    var display_dates = this.state.display_dates;
    return (
      <div>
        <Link className='date-changer left-date-changer' to={`/?start_date=${this.state.previous_date}`}>&lt;</Link>

        <table className='calendar'>
          <tbody>
            <tr>
              {display_dates.map(function(date, i) {
                if (date.weekend) {
                  return <th key={i} className='weekend'>
                    <p>{date.name}</p>
                    <p>{date.day_with_month}</p>                     
                    </th>;
                } else {
                  return <th key={i}>
                    <p>{date.name}</p>
                    <p>{date.day_with_month}</p>                     
                    </th>;
                }
              })}
            </tr>

            {this.state.events.map(function(event, i){
              var count = 0;
              return <tr key={i}>
                {display_dates.map(function(date, i) {
                  if (event.start_date === date.date || event.end_date === date.date || (event.start_date < date.date && event.end_date > date.date)) {
                    count++
                    if (count === 1) {
                      return <td key={i} className='scheduled-event'>{event.description}</td>;
                    } else {
                      return <td key={i} className='scheduled-event'></td>;
                    }
                  } else {
                    return <td key={i}></td>;
                  }
                })}
              </tr>;
            })}
          </tbody>
        </table>

        <Link className='date-changer right-date-changer' to={`/?start_date=${this.state.next_date}`}>&gt;</Link>
      </div>
    );
  }
}

export default EventsDisplay;
