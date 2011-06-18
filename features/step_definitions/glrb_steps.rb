When /^I enter the following personal info$/ do |table|
  on_page PersonalInfoPage do |page|
    page.complete_adoption table.hashes.first
  end
end

Then /^I should see "([^\"]*)"$/ do |expected_text|
  on_page HomePage do |page|
    page.text.should include expected_text
  end
end

When /^I complete the adoption leaving the "([^\"]*)" field blank$/ do |field|
  on_page PersonalInfoPage do |page|
    page.complete_adoption field.downcase => ''    
  end
end

Then /^I should see an error message with "([^\"]*)"$/ do |message|
  on_page PersonalInfoPage do |page|
    page.text.should include message
  end
end

Then /^the Pay with dropdown should contain "([^\"]*)"$/ do |value|
  on_page PersonalInfoPage do |page|
    page.pay_type_select_list.text.should include value
  end
end
