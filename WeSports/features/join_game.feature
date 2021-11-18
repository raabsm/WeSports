Feature: join a pickup sports game

  As a pickup-sports player
  So that I can join a game
  I want to be able to join a game that is available

  Background: games have been added to database

    Given the following games exist:
      | sport_name  | zipcode | slots_to_be_filled | slots_taken | game_start_time       | game_end_time        |
      | Spikeball   | 10027   | 4                  | 2           | 31-Oct-2021 12:00:00  | 31-Oct-2021 15:00:00 |
      | Basketball  | 10024   | 10                 | 0           | 1-Nov-2021 15:00:00  | 31-Oct-2021 15:30:00  |

    Given the following players exist:
      | username | email             | uid                   | provider      |
      | Jenny    | jxm033f@gmail.com | 118294165813028623643 | google_oauth2 |

    Given I am logged in as "118294165813028623643"
    And I am on the details page for "Spikeball"

  Scenario: I join the game

    When I press "Join Game"
    Then I should be on the details page for "Spikeball"
    And I should see "Successfully Joined Game"
    And I should see "Slots Left Available: 3"
    And I should see "Name: Jenny | Email: jxm033f@gmail.com"

  Scenario: Button disappears if all slots taken

    When I press "Join Game"
    Then I should be on the details page for "Spikeball"
    And I should see "Successfully Joined Game"
    And I should see "Slots Left Available: 3"
    And I should see "Name: Jenny | Email: jxm033f@gmail.com"
    And I should not see "Join Game"
