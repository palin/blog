Feature: Homepage

  Scenario: Viewing application's home page
    Given there's a post titled "My first" with "Hello, BDD world!" content
    And the post has been published
    When I visit the homepage
    Then I should see the "My first" title
    And I should see the date
    And I should see the "bdd world" tags
    And I should see the read more button

  Scenario: Viewing post's page
    Given there's a post titled "Super post" with "My favorite pizza" content
    And the post has been published
    When I visit the post page
    Then I should see the "Super post" title
    And I should see the "My favorite pizza" content