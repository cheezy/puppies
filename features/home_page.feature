Feature: Building out the features of the home page

  Background:
    Given I am on the puppy adoption site

  Scenario: Listing the puppies
    Then I should see 4 puppies on the home page

  Scenario: Displaying the puppy's name
    Then I should see the first puppy's name is Brook

  Scenario: Displaying the puppy's breed and gender
    Then I should see the first puppy's breed Golden Retriever
    And I should see the first puppy's gender is Female

  Scenario: Displaying the puppy's image
    Then I should see images for all of the puppies