Feature: Comment discussions

   As a logged user
   So that I can share my opinion
   I want to be able to leave a comment to a discussions
   And I want to be able to delete my comments if a change my mind

   As an admin
   So that I can moderate the site
   I want to be able to modify and delete comments

   Scenario: Leave a comment to a discussion
    Given I am a logged in user
    And there is at least a discussion
    And I am on the discussions page
    When I follow "Show"
    And I fill in "comment[content]" with "New_comment"
    And I press "Create Comment"
    Then I should see "New_comment"

    Scenario: Delete a comment
    Given I am a logged in user
    And there is at least a discussion
    And I am on the discussions page
    When I follow "Show"
    And I fill in "comment[content]" with "New_comment"
    And I press "Create Comment"
    And I follow "Delete Comment"
    Then I should not see "New_Comment"