Feature: View representatives profiles
  As a user
  I want to view the profile of any representative
  So that I can see more detailed information about them

  Scenario: Clicking on a representative's name on the representative page navigates to their profile
    Given I'm on the search page for "California"
    When I follow "Gavin Newsom"
    Then I should see the profile page for "Gavin Newsom"
    And I should see "Party"
  
  Scenario: The representative's profile displays their correct information
    Given I'm on the search page for "California"
    When I follow "Gavin Newsom"
    Then I should see the profile page for "Gavin Newsom"
    And I should see "OCD ID: ocd-division/country:us/state:ca"
    And I should see "1303 10th Street, Sacramento, CA, 95814"
    And I should see "Democratic"

  Scenario: Clicking on the representative's big name on the representative page navigates to their profile
    Given a representative named "Gavin Newsom" exists
    And I'm on a news articles page for "Gavin Newsom"
    When I click on big name "Gavin Newsom"
    Then I should see the profile page for "Gavin Newsom"
    And I should see "Details about Gavin Newsom"
  
  Scenario: Clicking on the representative's small name on the representative page navigates to their profile
    Given a representative named "Gavin Newsom" exists
    And I'm on a news articles page for "Gavin Newsom"
    When I click on small name "Gavin Newsom"
    Then I should see the profile page for "Gavin Newsom"
    And I should see "Details about Gavin Newsom"
