Given /^I am on the puppy adoption site$/ do
  visit_page HomePage
end

When /^I adopt a puppy$/ do
  on_page HomePage do |page|
    page.adopt_puppy_number 1
  end
  
  on_page PuppyDetailPage do |page|
    page.adopt_me
  end
  
  on_page YourLitterPage do |page|
    page.complete_the_adoption
  end
end
