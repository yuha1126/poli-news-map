Feature: Search for political representatives
  As a user
  I want to search for political representatives
  So that I can find the representatives for my region

  Scenario: Search for representatives by valid address
    Given I am on the representatives page
    When I fill in "address" with "California"
    And I press "Search"
    Then I should see a list of representatives

  Scenario: Search for representatives by invalid address
    Given I am on the representatives page
    When I fill in "address" with "InvalidLocation"
    And I press "Search"
    Then I should see "No representatives found"

  Scenario: Search without entering an address
    Given I am on the representatives page
    When I press "Search"
    Then I should see "No representatives found"

  Scenario: Return to search page from news articles
    Given a representative named "Gavin Newsom" exists
    And I'm on a news articles page for "Gavin Newsom"
    When I press "All Representatives"
    Then I should see "Search for a Representative"

