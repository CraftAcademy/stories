
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'devise'
require 'capybara/rails'

Chromedriver.set_version '2.36' unless ENV['CI'] == 'true'

chrome_options = %w[no-sandbox disable-popup-blocking disable-infobars]
chrome_options << 'headless' if ENV['CI'] == 'true'

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
    args: chrome_options
  )
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

Capybara.javascript_driver = :chrome

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:suite) do
    Warden.test_mode!
    RedisTest.start
    RedisTest.configure(:default, :sidekiq)
    DatabaseCleaner.clean_with :truncation
  end

  config.after(:suite) do
    RedisTest.stop
  end

  config.before(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
    RedisTest.clear
  end

  config.include Devise::TestHelpers, type: :controller
  config.include ControllerMacros, type: :controller
  config.include Features, type: :feature
  config.include Warden::Test::Helpers
  config.include FactoryBot::Syntax::Methods

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
