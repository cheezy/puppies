Feature: Behavior of the Details Page

  Background:
    Given I am on the details page for Brook

  Scenario: Displaying the puppy's basic information
    Then I should see the puppy's name is Brook
    And I should see the puppy's breed is Golden Retriever
    And I should see the puppy's gender is Female

  Scenario: Displaying the puppy's description
    Then I should see the description includes
    """This young lady is trying to put her shelter experience behind her
    """

  Scenario: Displaying the adoption fee
    Then I should see the adoption fee is $34.95
