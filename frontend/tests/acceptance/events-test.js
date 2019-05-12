import { module, test } from "qunit";
import { visit, currentURL, click, fillIn } from "@ember/test-helpers";
import { setupApplicationTest } from "ember-qunit";
import setupMirage from "ember-cli-mirage/test-support/setup-mirage";

module("Acceptance | events", function(hooks) {
  setupApplicationTest(hooks);
  setupMirage(hooks);

  test("visiting /events", async function(assert) {
    await visit("/events");

    assert.equal(currentURL(), "/events");
  });

  test("should show events as the home page", async function(assert) {
    await visit("/");

    assert.equal(currentURL(), "/events", "should redirect automatically");
  });

  test("should list available events", async function(assert) {
    const count = 7;
    server.createList("event", count);

    await visit("/events");

    assert.equal(
      this.element.querySelectorAll(".fc-event").length,
      count,
      `should display ${count} events`
    );
  });

  test("should create a new event", async function(assert) {
    await visit("/events");
    assert.equal(
      this.element.querySelectorAll(".fc-event").length,
      0,
      `should be empty`
    );
    await click("#add_event_btn");
    await fillIn("#add_event_modal textarea", "Event description goes here");
    const today = new Date().toJSON().slice(0,10);
    await fillIn("#add_event_modal #start_date > input", today);
    await click("#add_event_modal .modal-footer > .btn-primary");

    assert.equal(
      this.element.querySelectorAll(".fc-event").length,
      1,
      `should display the created event`
    );
  });
});
