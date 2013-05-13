require 'rubygems'
require 'spork'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'factory_girl'

#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  FactoryGirl.find_definitions

end

Spork.each_run do
  # This code will be run each time you run your specs.

end

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
end

def set(variable_name, &block)
  before(:all) do
    self.class.send(:class_variable_set, "@@#{variable_name}".to_sym, instance_eval(&block))
  end

  after(:all) do
    self.class.send(:class_variable_get, "@@#{variable_name}".to_sym).tap do |i|
      if i.respond_to?(:delete)
        i.delete
      end
    end
  end

  let(variable_name) do
    self.class.send(:class_variable_get, "@@#{variable_name}".to_sym).tap do |i|
      if i.respond_to?(:new_record?)
        i.reload unless i.new_record?
      end
    end
  end
end
