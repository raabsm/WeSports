Feature: Filter table by a specific Sport
  As an user, I would like to filter the table
  by a specific sport.

Background: games have been added to database
  Given the following games exist:
    | sport_name  | zipcode | slots_to_be_filled | slots_taken | game_start_time       | game_end_time |
    | Spikeball   | 10027   | 4                  | 2           | 31-Oct-2021 15:03:00  |               |
    | Basketball  | 10024   | 10                 | 0           | 31-Oct-2021 15:03:00  |               |
    | basketball  | 10025   | 10                 | 3           | 03-Nov-2021 10:00:00  |               |
    | Football    | 10030   | 22                 | 18          | 03-Nov-2021 16:00:00  |               |
    | soccer      | 10010   | 10                 | 7           | 03-Nov-2021 12:00:00  |               |

  Given the following players exist:
    | username | email             | uid                   | provider      |
    | Jenny    | jxm033f@gmail.com | 118294165813028623643 | google_oauth2 |

  Given I am logged in as "118294165813028623643"
  And  I am on the WeSports home page
  Then 5 seed games should exist

  Scenario: Filter list of games by sport "Spikeball"
    Given I am on the home page

    When  I fill in "search-name-bar" with "Spikeball"
    And I press "Name Filter"

    Then I should not see "Basketball"
    Then I should not see "Football"
    Then I should not see "soccer"
    Then I should not see "basketball"

    Then I should see "Spikeball"

  Scenario: Filter list of games by sport that has both lowercase and uppercase
    Given I am on the home page

    When  I fill in "search-name-bar" with "basketball"
    And I press "Name Filter"

    Then I should not see "Spikeball"
    Then I should not see "Football"
    Then I should not see "soccer"

    Then I should see "Basketball"
    Then I should see "basketball"

  Scenario: Filter list of games with invalid sport name
    Given I am on the home page

    When  I fill in "search-name-bar" with "invalid"
    And I press "Name Filter"

    Then I should not see "Basketball"
    Then I should not see "Football"
    Then I should not see "soccer"
    Then I should not see "basketball"