Feature: Upvote a discussion

   As a logged in User
   In order to help people understand this is a good discussion
   I want to be able to upvote a discussion

   Scenario: Upvote a discussion
   Given I am a logged in user
    And there is at least a discussion
    And I am on the discussions page
    And I follow "Show"
   When I follow "discussion-upvote-link"
   Then I should see "1"

   Scenario: Change a vote from an upvote to a downvote for a discussion
   Given I am a logged in user
    And there is at least a discussion
    And I am on the discussions page
    And I follow "Show"
   When I follow "discussion-upvote-link"
    And I follow "discussion-upvote-link"
   Then I should see "0"

   Scenario: Remove a vote from a discussion
   Given I am a logged in user
    And there is at least a discussion
    And I am on the discussions page
    And I follow "Show"
   When I follow "discussion-upvote-link"
    And I follow "discussion-upvote-link"
   Then I should see "0"