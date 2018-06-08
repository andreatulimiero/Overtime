Feature: Create a discussion

    As USER
    I want to CREATE A DISCUSSION
    So that I can ΙΝSERT IT INTO THE DATABASE

    Scenario: Logged in user creates a discussions
        Given I am a logged in user
            And I am on the discussions page
        When I follow "create-discussion-link"
            And I fill in "discussion[title]" with "New_title"
            And I fill in "discussion[body]" with "New_body"
            And I press "Create Comment"
        Then I should see "New_title"
            And I should see "New_body"