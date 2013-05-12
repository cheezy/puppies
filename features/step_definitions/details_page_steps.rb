Given(/^I am on the details page for Brook$/) do
  visit HomePage
  navigate_to DetailsPage
end

Then(/^I should see the puppy's name is (.+)$/) do |name|
  on(DetailsPage).puppy_info.should include name
end

When(/^I should see the puppy's breed is (.+)$/) do |breed|
  on(DetailsPage).puppy_info.should include breed
end

When(/^I should see the puppy's gender is (.+)$/) do |gender|
  on(DetailsPage).puppy_info.should include gender
end

Then(/^I should see the description includes$/) do |text|
  on(DetailsPage).puppy_info.should include text
end

Then(/^I should see the adoption fee is (\$\d+\.\d+)$/) do |fee|
  on(DetailsPage).adoption_fee.should == fee
end