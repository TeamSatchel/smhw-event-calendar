import moment from 'moment'

// Those specs rely on fresh data loaded from db/seeds and a running development backend
describe('Events Calendar', () => {
  const weekDayToday = moment().format('dddd')

  it('displays the calendar', () => {
    cy.visit('/')

    // title
    cy.contains('h1', 'Events Calendar')

    // current day highlighted
    cy.get('p.day.today').contains(weekDayToday)

    // display events
    cy.contains('Meeting 1')
    cy.contains('Copenhagen')
    cy.contains('Meeting 2')
    cy.contains('Warsaw')
  })

  it('allows adding a new event', () => {
    const title = 'Event title'

    cy.visit('/')

    // add event
    cy.get('.new-event').click()
    cy.get('input[name=title]').type(title)
    cy.get('.create-event').click()

    cy.wait(500)

    // verify it's being displayed
    cy.get('.event .title').contains(title)
  })
})
