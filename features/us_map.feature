Feature: US Map Interactivity
  As a user
  I want to click on a state on the map
  So that I can see more information about the state

  Scenario: Clicking on a state and seeing a list of counties
    Given the following states exist:
      | name       | symbol | fips_code | is_territory | lat_min     | lat_max     | long_min   | long_max   |
      | California | CA     | 6         | false        | -124.409591 | 32.534156  | -114.131211 | -114.131211 |

  When I visit the state map for "CA"
  Then I should see "California"
