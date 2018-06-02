Feature: Save a discussion among preferred

   As a logged in user
   I want to be able to star a discussion
   To be able to find it later

   Scenario: Save a discussion among preferred
   Given I am a logged in user
    And there is at least a discussion
    And I am on the discussions page
    And I follow "Show"
   When I follow "discussion-star-link"
   Then I should see "starred" css