# Add a declarative step here for populating the DB with movies.

Given /the following games exist/ do |games_table|
  games_table.hashes.each do |game|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Game.create(game)
  end
end

Then /(.*) seed games should exist/ do | n_seeds |
  Game.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  page.body =~ /#{e1}.+#{e2}/
end

When /^I add "(.*)" to the search box$/ do |item|
  @browser.find_element(:id, 'search-bar').send_keys(item)
end

And /^I click the Search Button$/ do
  @browser.find_element(:id, 'search-button').click
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

Then /I should see all the games/ do
  # Make sure that all the movies in the app are visible in the table
  Game.count() == page.all("#games").size() - 1
end
