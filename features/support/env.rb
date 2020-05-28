
require 'cucumber/rspec/doubles'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'capybara/apparition'
require 'launchy'
require 'pry'

class DevNull
  # suppress noisy JS logging from https://www.metropolitan.org.uk e.g.:
  #   -> log: JQMIGRATE: Migrate is installed, version 1.4.1
  def puts(_string); end
end

Capybara.register_driver :apparition do |app|
  Capybara::Apparition::Driver.new(
    app,
    browser_logger: DevNull.new,
    window_size: [1200, 800]
  )
end
Capybara.default_driver = :apparition
Capybara.javascript_driver = :apparition
