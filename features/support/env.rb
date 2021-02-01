require "dotenv/load"
require "bundler"
require "capybara/dsl"
require "capybara/rspec"
require "capybara/cucumber"
require "test/unit/assertions"
require "test-unit"
require "minitest"
require "pry"
require_relative "../helpers/helper"

Bundler.setup(:default)
Bundler.require

# Which default browser do you want Selenium WebDriver to use?
# :selenium_chrome # Selenium driving Chrome
# :selenium_chrome_headless # Selenium driving Chrome in a headless configuration
# https://github.com/teamcapybara/capybara#selenium

Capybara.default_driver = :selenium_chrome
Capybara.app_host = "https://the-internet.herokuapp.com"
Capybara.default_max_wait_time = 10
Capybara.default_selector = :xpath

# Run using:
# bundle exec rspec spec/features/login.rb --format documentation
# ... Or...

RSpec.configure do |config|
  config.formatter = :documentation
end
