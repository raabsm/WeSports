Feature: delete game from games list

  As an interested user
  I want to see games that will actually occur

Background: games have been added to database

  Given the following games exist:
    | sport_name  | zipcode | slots_to_be_filled | slots_taken | game_start_time       | game_end_time |
    | Spikeball   | 10027   | 4                  | 2           | 31-Oct-2021 15:03:00  |               |
    | Basketball  | 10024   | 10                 | 0           | 31-Oct-2021 15:03:00  |               |

  And  I am on the WeSports home page
  Then 2 seed games should exist

Scenario: join game from games
  Given I am on the details page for "Spikeball"
  And  I press "Join"