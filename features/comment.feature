Feature: Comment

  Background:
    Given there's a post titled "Super post" with "My favorite pizza" content
    And the post has been published
    And I visit the post page

  Scenario: Form fields visibility
    Then I should see comment author input
    And I should see comment content input
    And I should see comment submit button

  @javascript
  Scenario: Adding new comment
    When I fill in author input with "My name"
    And I fill in content input with "Super comment here"
    And I press submit button
    Then I should see the new comment with author "My name"
    And I should see the new comment with content "Super comment here"
    And I should see the today's date