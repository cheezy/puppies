Feature: Behavior for the Shopping Cart page

  Background:
    Given I am on the puppy adoption site

  Scenario: Displaying a puppy in the shopping cart
    When I add Brook to the shopping cart
    Then I should see Brook for the name on line item 1
    And I should see $34.95 for the subtotal on line item 1
    And I should see $34.95 for the cart total

  Scenario: Displaying two puppies in the shopping cart
    When I add Brook to the shopping cart
    And I also add Hanna to the shopping cart
    Then I should see Brook for the name on line item 1
    And I should see $34.95 for the subtotal on line item 1
    And I should see Hanna for the name on line item 2
    And I should see $22.99 for the subtotal on line item 2
    And I should see $57.94 for the cart total
