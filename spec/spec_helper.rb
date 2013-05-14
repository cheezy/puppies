require 'rubygems'
require 'spork'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'factory_girl'

Spork.prefork do

  FactoryGirl.find_definitions
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec

    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    config.use_transactional_fixtures = true
  end

end

Spork.each_run do

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
