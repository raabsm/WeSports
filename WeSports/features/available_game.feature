Feature: Filter table by a specific zipcode
  As an user, I would like to filter the table
  by a specific zipcode.

Background: games have been added to database
  Given the following games exist:
    | sport_name  | zipcode | slots_to_be_filled | slots_taken | game_start_time       | game_end_time |
    | Spikeball   | 10027   | 4                  | 2           | 31-Oct-2021 15:03:00  |               |
    | Basketball  | 10024   | 10                 | 10          | 31-Oct-2021 15:03:00  |               |
    | basketball  | 10025   | 10                 | 3           | 03-Nov-2021 10:00:00  |               |
    | Football    | 10030   | 22                 | 22          | 03-Nov-2021 16:00:00  |               |
    | soccer      | 10027   | 10                 | 7           | 03-Nov-2021 12:00:00  |               |

  And  I am on the WeSports home page
  Then 5 seed games should exist

Scenario: Only see available games
  Given I am on the home page

  When  I check "only_available"
  And I press "Refresh"

  Then I should not see "Basketball"
  Then I should not see "Football"

  Then I should see "soccer"
  Then I should see "basketball"
  Then I should see "Spikeball"

Scenario: Only see available games that are in "10027" with name like "Spikeball"
  Given I am on the home page

  When  I check "only_available"
  And I press "Refresh"

  When  I fill in "search-name-bar" with "Spikeball"
  And I press "Name Filter"

  When  I fill in "search-zipcode-bar" with "10027"
  And I press "Zip Filter"

  Then I should not see "Basketball"
  Then I should not see "Football"
  Then I should not see "soccer"
  Then I should not see "basketball"

  Then I should see "Spikeball"

Scenario: See all games
  Given I am on the home page

  When  I uncheck "only_available"
  And I press "Refresh"

  Then I should see "Basketball"
  Then I should see "Football"
  Then I should see "soccer"
  Then I should see "basketball"
  Then I should see "Spikeball"