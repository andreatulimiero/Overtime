Feature: Delete a comment

   As a logged user
   So that I can share my opinion
   I want to be able to leave a comment to a discussions

   As an admin
   So that I can moderate the site
   I want to be able to modify and delete comments

    Scenario: Delete a comment
        Given I am a logged in user
        And there is at least a discussion
        And I am on the discussions page
        When I follow "Show"
        And I fill in "comment[content]" with "New_comment"
        And I press "Create Comment"
        And I follow "Delete Comment"
        Then I should not see "New_Comment"

    Scenario: Can't delete a comment if I'm not the owner
        Given I am a logged in user
        And there is at least a discussion
        And I am on the discussions page
        When I follow "Show"
        And I fill in "comment[content]" with "New_comment"
        And I press "Create Comment"
        And I follow "Log out"
        And I am another logged in user
        And I am on the discussions page
        And I follow "Show"
        Then I should not see "Delete Comment"