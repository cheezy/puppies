@wip
Feature: Behavior of the Checkout page

  Background:
    Given I am ready to checkout

  @focus
  Scenario: Name is required
    When I attempt to checkout without a name
    Then I should see the error message "Name can't be blank"

  Scenario: Address is required
    When I attempt to checkout without an address
    Then I should see the error message "Address can't be blank"

  Scenario: Email is required
    When I attempt to checkout without and email
    Then I should see the error message "Email can't be blank"

  Scenario: Valid forms of payment
    Then the valid forms a payment should be
      | pay_type       |
      | Credit card    |
      | Purchase order |
      | Check          |

  Scenario: Thank you message should display after checkout is complete
    When I complete the adoption
    Then I should see "Thank you for adopting a puppy"

