# smhw-event-calendar

### Implemntation

This version uses zero third-party libraries such as calendars, WYSIWYG HTML editors, date pickers.
It was made intentionally, because of autor's interest in implementation details of these libraries.
Solution isn't complete and just serve for purpose of reflecting way of thinking of the autor and his
ability to solve UI-related tasks.

Approach, when events are displayed over the table isn't the most "right" one, but it is easy to implement.
The "calendar" has a lot of limitations, so please use it in scope of current week.

### TODO:

- [ ] Add value object which will hold default values and date parsing logic for Event model
- [ ] Check probably Rails' new attributes API can handle the case above
- [ ] Add RSpec tests for model
- [ ] Add validation and logic for displaying errors from backend response
- [ ] Add borders to events on calendar
- [ ] Description should show HTML, not plain text
- [ ] Show events which begin/end on next/previous week
