Feature: create a new pickup sports game

  As a pickup-sports player
  So that I can create games for other people to join
  I want to be able to add a game that other players can find

Background:

  Given I am on the WeSports home page

Scenario: I navigate to the add new game page

  When I press "Add new game"
  Then I should be on the new game page

Scenario: I create a new game

  When I am on the new game page
  When I fill in the following:
    | Sport Name            | Random Test Sport|
    | Zip Code              | 10027            |
    | Total Slots Available | 10               |

  And I press "Save Changes"
  Then I should see "Random Test Sport"


