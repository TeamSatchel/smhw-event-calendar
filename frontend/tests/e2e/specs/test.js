// https://docs.cypress.io/api/introduction/api.html

describe('Events Calendar', () => {
  it('displays the calendar', () => {
    cy.visit('/')
    cy.contains('h1', 'Events Calendar')
  })
})
