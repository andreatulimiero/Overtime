Feature: Upvote a discussion

   As a logged in User
   In order to help people understand this is a good discussion
   I want to be able to upvote a discussion

   Scenario: Upvote a discussion
   Given I am a logged in user
    And there is at least a discussion
    And I am on the discussions page
    And I follow "Show"
   When I follow "Upvote"
   Then I should see "Upvotes: 1"

   Scenario: Change a vote from an upvote to a downvote for a discussion
   Given I am a logged in user
    And there is at least a discussion
    And I am on the discussions page
    And I follow "Show"
   When I follow "Upvote"
    And I follow "Downvote"
   Then I should see "Upvotes: 0"
    And I should see "Downvotes: 1"

   Scenario: Remove a vote from a discussion
   Given I am a logged in user
    And there is at least a discussion
    And I am on the discussions page
    And I follow "Show"
   When I follow "Upvote"
    And I follow "Upvote"
   Then I should see "Upvotes: 0"