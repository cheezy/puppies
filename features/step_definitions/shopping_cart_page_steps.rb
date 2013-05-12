When(/^I add (.+) to the shopping cart$/) do |name|
  on(HomePage).adopt name
  on(DetailsPage).add_to_cart
end

When(/^I also add (.+) to the shopping cart$/) do |name|
  on(ShoppingCartPage).continue_shopping
  on(HomePage).adopt name
  on(DetailsPage).add_to_cart
end

Then(/^I should see (.+) for the name on (line item \d+)$/) do |name, item|
  on(ShoppingCartPage).name_for_line_item(item).should include name
end

When(/^I should see (\$\d+\.\d+) for the subtotal on (line item \d+)$/) do |subtotal, item|
  on(ShoppingCartPage).subtotal_for_line_item(item).should == subtotal
end

When(/^I should see (\$\d+\.\d+) for the cart total$/) do |total|
  on(ShoppingCartPage).cart_total.should == total
end
