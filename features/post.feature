Feature: Post

  Background:
    Given there's a post titled "Super post" with "My favorite pizza" content
    And the post has been published
    And I visit the post page

  Scenario: Title and content visibility
    Then I should see the "Super post" title
    And I should see the "My favorite pizza" content


  Scenario: Comments visibility
    Then I should see comments box
    And I should see new comment form
