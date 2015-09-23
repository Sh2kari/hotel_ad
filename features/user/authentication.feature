Feature: Authenticatig users
  In order to add hotels
  As a user
  I should be able to sign up & log in

  Scenario: Signing up
    Given I am on the homepage
    When I sign up
    Then I should see a sign up confirmation
    And I should be logged in

  Scenario: Log in & Logout
    Given I am registered
    And I am on the homepage
    When I log in
    Then I should see a log in confirmation
    When I log out
    Then I should see the log out confirmation