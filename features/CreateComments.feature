Feature: Leave a comment

   As a logged user
   So that I can share my opinion
   I want to be able to leave a comment to a discussions

   Scenario: Leave a comment to a discussion
    Given I am a logged in user
        And there is at least a discussion
        And I am on the discussions page
    When I follow "Show"
        And I fill in "comment[content]" with "New_comment"
        And I press "Create Comment"
    Then I should see "New_comment"