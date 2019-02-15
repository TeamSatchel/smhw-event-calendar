class Alerts {
  static flash(...args) {
    Alerts.empty();
    Alerts.fill(...args);
    Alerts.fadeInOut();
  }
  
  static empty() {
    let $block = $('.js-alerts');
    
    $block.attr('class', 'js-alerts alerts-pop-up');
    $block.empty();
  }
  
  static fill(messages, cssClass = '') {
    let $block = $('.js-alerts');
    let collection = Array.isArray(messages) ? messages : [messages];
    
    $block.addClass(cssClass);
    collection.forEach((message) => {
      $block.append(`<p>${message}</p>`)
    });
  }
  
  static fadeInOut() {
    const duration = 800;
    const delay = 2000;
    
    let $alertsBlock = $('.js-alerts');
    let $button = $('.js-submit');
    
    $alertsBlock
      .fadeIn(duration)
      .delay(delay)
      .fadeOut(duration);
    
    setTimeout(() => {
      $button.prop('disabled', false);
    }, 1000);
  }
}
