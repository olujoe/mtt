require 'bundler/setup'
require 'rubygems'
require 'rspec'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'site_prism'

configuration = YAML.load(File.read('features/test_data/config.yml'))
TEST_ENV = ENV['site'] || 'live'
default_browser = ENV['browser'] || configuration['default_browser']
puts "Using '#{default_browser}' browser"

Capybara.configure do |config|
	config.default_driver         = :selenium
	config.javascript_driver      = :selenium
	config.run_server             = false
	config.default_selector       = :css
	config.default_max_wait_time  = configuration['wait']
	Capybara.app_host             = configuration['google_home_page']
	config.match                  = :prefer_exact
	config.ignore_hidden_elements = false
end

Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Chrome::Profile.new
  profile["browser.cache.disk.enable"] = false
  profile["browser.cache.memory.enable"] = false
  Capybara::Selenium::Driver.new(app, :browser => :chrome, profile: profile)
end