require 'watir-webdriver'

Before do
  @browser = Watir::Browser.new :firefox
end

After do
  sleep 3
  @browser.close
end
