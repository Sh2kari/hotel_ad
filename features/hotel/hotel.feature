Feature: Adding & destroying & editing hotel
  As a user
  I should be able to add & edit & delete hotel

  Scenario: Adding hotel
    Given I am on the homepage
    Given I sign up
    When I add hotel
    Then I should see a hotel create confirmation
    When I edit hotel
    Then I should see a hotel edit confirmation
    When I destroy hotel
    Then I should see a hotel destroy confirmation
