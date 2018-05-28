Feature: Downvote a discussion

   As a logged in User
   In order to help people understand this is a bad discussion
   I want to be able to Downvote a discussion

   Scenario: Downvote a discussion
   Given I am a logged in user
    And there is at least a discussion
    And I am on the discussions page
    And I follow "Show"
   When I follow "Downvote"
   Then I should see "Downvotes: 1"

   Scenario: Change a vote from a downvote to an upvote for a discussion
   Given I am a logged in user
    And there is at least a discussion
    And I am on the discussions page
    And I follow "Show"
   When I follow "Downvote"
    And I follow "Upvote"
   Then I should see "Downvotes: 0"
    And I should see "Upvotes: 1"

   Scenario: Remove a vote from a discussion
   Given I am a logged in user
    And there is at least a discussion
    And I am on the discussions page
    And I follow "Show"
   When I follow "Downvote"
    And I follow "Downvote"
   Then I should see "Downvotes: 0"