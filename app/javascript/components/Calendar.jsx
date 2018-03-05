import React from "react";
import PropTypes from "prop-types";
import moment from "moment";

import CalendarDay from "./CalendarDay";

export default class Calendar extends React.Component {
  constructor(props) {
    super(props);
    this.startOfWeek = moment().startOf('isoWeek');
    this.endOfWeek = moment().endOf('isoWeek');
  }

  render() {
    return (
      <div>
        {this.computeWeekDays()}
      </div>
    );
  }

  computeWeekDays() {
    const weekDays = [];
    const eventsByRows = this.groupEventsByRows();

    for (let dayNumber=0; dayNumber<7; dayNumber++) {
      const currentDate = moment(this.startOfWeek).add(dayNumber, 'd');
      const eventsOnDayByRows = eventsByRows.map(eventsRow => {
        return eventsRow.find(event => {
          const startDate = moment(event.attributes.startDate);
          const endDate = moment(event.attributes.endDate);
          return currentDate.isBetween(startDate, endDate, 'd', '[]');
        });
      });

      weekDays.push(
        <CalendarDay
          key={currentDate.unix()}
          date={currentDate}
          events={eventsOnDayByRows} />
      );
    }

    return weekDays;
  }


  // these two methods should be moved out of component if it would grow bigger
  // to e.g. some service object
  // I don't think, it makes much sense to move it away now though
  groupEventsByRows() {
    const eventsOnWeek = this.eventsHappenOnWeek().sort((a, b) => (
      moment(a.attributes.startDate) - moment(b.attributes.startDate)
    ));

    return eventsOnWeek.reduce((acc, item) => {
      let rowFound = false;
      acc.map((events) => {
        let lastEventInRow = events[events.length - 1];
        if (moment(lastEventInRow.attributes.endDate).isBefore(moment(item.attributes.startDate)) && !rowFound) {
          rowFound = true;
          events.push(item);
        }
        return events;
      });
      if (!rowFound) acc.push([item]);
      return acc;
    }, []);
  }

  eventsHappenOnWeek() {
    return this.props.events.filter(event => {
      let startDate = moment(event.attributes.startDate);
      let endDate = moment(event.attributes.endDate);
      return startDate.isBetween(this.startOfWeek, this.endOfWeek, 'd', '[]') ||
             endDate.isBetween(this.startOfWeek, this.endOfWeek, 'd', '[]') ||
             (startDate.isBefore(this.startOfWeek, 'd') && endDate.isAfter(this.endOfWeek, 'd'));
    });
  }
}

Calendar.defaultProps = {
  events: [],
};

Calendar.propTypes = {
  events: CalendarDay.propTypes.events,
};
