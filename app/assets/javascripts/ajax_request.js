//= require alerts

class AJAXRequest {
  static send(url, options = {}) {
    $.ajax({
      url: url,
      type: options.method,
      data: options.data,
      dataType: 'json',
      error: options.errorCallback || AJAXRequest.defaultErrorCallback,
      success: options.successCallback || AJAXRequest.defaultSuccessCallback
    });
  }
  
  static defaultErrorCallback(response) {
    let errors = response.responseJSON;
    
    Alerts.flash(errors, 'error-alert');
  }
  
  static defaultSuccessCallback(response) {
    Alerts.flash(response.message, 'notice-alert');
  }
}
