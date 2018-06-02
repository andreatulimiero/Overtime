Feature: Downvote a discussion

   As a logged in User
   In order to help people understand this is a bad discussion
   I want to be able to Downvote a discussion

   Scenario: Downvote a discussion
   Given I am a logged in user
    And there is at least a discussion
    And I am on the discussions page
    And I follow "Show"
   When I follow "discussion-downvote-link"
   Then I should see "-1"

   Scenario: Change a vote from a downvote to an upvote for a discussion
   Given I am a logged in user
    And there is at least a discussion
    And I am on the discussions page
    And I follow "Show"
   When I follow "discussion-downvote-link"
    And I follow "discussion-upvote-link"
   Then I should see "0"

   Scenario: Remove a vote from a discussion
   Given I am a logged in user
    And there is at least a discussion
    And I am on the discussions page
    And I follow "Show"
   When I follow "discussion-downvote-link"
    And I follow "discussion-downvote-link"
   Then I should see "0"