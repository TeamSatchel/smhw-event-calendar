$(document).ready(function() {

  var events = [
    {start: '2019-02-18', end: '2019-02-20', summary: "Some event # 1", mask: true},
    {start: '2019-02-22', end: '2019-02-23', summary: "Some event # 1", mask: true}
  ];
  $('#calendar').calendar({
    events: events
  });

});