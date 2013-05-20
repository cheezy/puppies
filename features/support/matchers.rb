RSpec::Matchers.define :have_error_message do |error|
  match do |page|
    page.errors.include? error
  end

  failure_message_for_should do |page|
    "Expected '#{page.errors}' to include '#{error}'"
  end

  failure_message_for_should_not do |page|
    "Expected '#{page.errors}' to not include '#{error}'"
  end
end
