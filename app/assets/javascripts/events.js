$( document ).on('turbolinks:load', function() {
  $("#calendar").calendar({
    view: 'week',
    events_source: '/events',
    tmpl_path: "/tmpls/",
    modal: "#events-modal",
    modal_type: "template",
    modal_title : function (e) { return e.title; },
    first_day: 1
  });
});
