Feature: Search for political representatives by county map
  As a user
  I want to search for political representatives by county map
  So that I can find the representatives for my region

Background: representatives have been added to database

  Given the following representatives exist:
  | Name                    | Office                               |
  | Joseph R. Biden         | President of the United States	     | 
  | Kamala D. Harris        | Vice President of the United States	 |
  | William W. Hood III	    | CO State Supreme Court Justice	     |
  | Jarrod Poley          	| Jackson County Sheriff	             |
  | Ekho Wyatt            	| Jackson County Treasurer	           |
  | Randy Miller	          | Jackson County Surveyor	             |
  | George Crocket	        | Jackson County Coroner               |

  #And I am on the state CO map
  #Then 7 seed representatives should exist
  
  #Scenario: Search for representatives by clicking on my county
    #Given I am on the state CO map
    #When I press on the county with label "Jackson County, CO"
    #Then I am on the search page with an address "Jackson County, CO"
    #Then I should see a list of representatives from "Jackson County, CO"

  #Scenario: Search for representatives by clicking list below
    #Given I am on the state CO map
    #When I press on the link with label "Counties in Colorado"
    #Then I should see "Adams County"
    #Then I should see "Alamosa County"
    #Then I should see "Custer County"

  #Scenario: Search for representatives by clicking list below and clicked on "Counties in Colorado"
    #Given I am on the state CO map
    #When I press on the link with label "View" next to "Jackson County"
    #Then I am on the search page with an address "Jackson County, CO"
    #Then I should see a list of representatives from "Jackson County, CO"

  #Scenario: Identical County Name are reserved for their state
    #Given I am on the state CO map
    #When I press on the county with label "Jackson County, CO"
    #Then I am on the search page with an address "Jackson County, CO"
    #Then I should not see "Donna Peyton"