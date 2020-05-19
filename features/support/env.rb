require 'capybara/cucumber'
require 'selenium-webdriver'
require 'yaml'
require 'site_prism'
require 'rspec'
require_relative 'page_object.rb'
require_relative 'helper.rb'

CONFIG = YAML.load_file("#{Dir.pwd}/config/address.yml")
BROWSER = ENV['BROWSER']
  
World(PageObjects)
World(Helper)

Capybara.register_driver :selenium do |app|

  if BROWSER.eql?('chrome')
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
  elsif BROWSER.eql?('chrome_headless')
      Capybara::Selenium::Driver.new(app, :browser => :chrome,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
       'chromeOptions' => {'args' =>['--headless', 'disable-gpu']}
      )
  )
  elsif BROWSER.eql?('firefox')
      Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette =>true)
  elsif BROWSER.eql?('firefox_headless')
      browser_options = Selenium::WebDriver::Firefox::Options.new(args: ['--headless'])
      Capybara::Selenium::Driver.new(app, :browser => :firefox,options: browser_options)
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = CONFIG['URL']
  config.default_max_wait_time = 30
end