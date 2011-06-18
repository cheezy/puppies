Feature: Entering your personal info to complete an adoption

  Background:
    Given I am on the puppy adoption site

  Scenario: Filling in all fields
    When I complete the adoption
    And I enter the following personal info
    | name      | address          | email           | pay_type    |
    | Sam Smith | 1213 Main Street | sam@example.com | Credit card |
    Then I should see "Thank you for adopting a puppy"

  Scenario: Name is required
    When I complete the adoption
    And I complete the adoption leaving the "Name" field blank
    Then I should see an error message with "Name can't be blank"

  Scenario: Address is required
    When I complete the adoption
    And I complete the adoption leaving the "Address" field blank
    Then I should see an error message with "Address can't be blank"

  Scenario: Email is required
    When I complete the adoption
    And I complete the adoption leaving the "Email" field blank
    Then I should see an error message with "Email can't be blank"

  Scenario: Options for Pay with
    When I complete the adoption
    Then the Pay with dropdown should contain "Check"
    And the Pay with dropdown should contain "Credit card"
    And the Pay with dropdown should contain "Cash"