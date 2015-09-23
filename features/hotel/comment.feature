Feature: Adding & destroying comment
  As a user
  I should be able to add & delete hotel

  Scenario: Adding comment
    Given I am on the homepage
    Given I sign up
    Given I add hotel
    Given I should see a hotel create confirmation
    When I add comment
    Then I should see a comment create confirmation
    When I destroy hotel
    Then I should see a hotel destroy confirmation