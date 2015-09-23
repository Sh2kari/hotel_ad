Feature: Editing and deleting users
  As a user
  I should be able to edit & delete profile

  Scenario: Edit profile & cancel profile
    Given I am registered
    And I am on the homepage
    When I log in
    Then I should see a log in confirmation
    When I edit profile
    Then I should see the edit profile
    When I cancel profile
    Then I should see the cancel confirmation