Given(/^I am on the puppy adoption site$/) do
  visit HomePage
end

Then(/^I should see (\d+) puppies on the home page$/) do |number|
  on(HomePage).names.length.should == number.to_i
end

Then(/^I should see the first puppy's name is (.+)$/) do |name|
  on(HomePage).names[0].should == name
end

Then(/^I should see the first puppy's breed (.+)$/) do |breed|
  on(HomePage).details[0].should include breed
end

When(/^I should see the first puppy's gender is (.+)$/) do |gender|
  on(HomePage).details[0].should include gender
end

Then(/^I should see images for all of the puppies$/) do
  on(HomePage) do |page|
    number_puppies = page.names.length
    page.images.length.should == number_puppies
  end
end
