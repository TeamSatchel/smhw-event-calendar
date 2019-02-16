chrome_options = begin
  case ENV.fetch('BROWSER', 'headless_chrome')
  when 'headless_chrome'
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-gpu')
    options.as_json
  when 'chrome'
    {}
  else
    raise 'Unknown browser'
  end
end

Capybara.register_driver :chromedriver do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(chrome_options)
  )
end

Capybara.server = :webrick
Capybara.app_host = 'http://localhost:5050'
Capybara.server_host = 'localhost'
Capybara.server_port = '5050'
Capybara.default_max_wait_time = 3
Capybara.default_driver = :chromedriver
Capybara.javascript_driver = :chromedriver
Capybara.ignore_hidden_elements = true
Capybara.automatic_label_click = true

Capybara::Screenshot.register_driver(:chromedriver) do |driver, path|
  driver.browser.save_screenshot(path)
end

Capybara::Screenshot.prune_strategy = :keep_last_run
