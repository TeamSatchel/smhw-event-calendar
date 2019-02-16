module WaitAlert
  def wait_for_alert
    loop do
      begin
        page.driver.browser.switch_to.alert
      rescue Selenium::WebDriver::Error::NoAlertOpenError
        next
      end
      break
    end
  end
end

World(WaitAlert)
