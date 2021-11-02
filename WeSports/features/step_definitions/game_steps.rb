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

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

'''
When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  if uncheck == "un"
    rating_list.split(", ").each {|rating| step %{I uncheck "ratings_#{rating}"}}
  else
    rating_list.split(", ").each {|rating| step %{I check "ratings_#{rating}"}}
  end
end
'''

Then /I should see all the games/ do
  # Make sure that all the movies in the app are visible in the table
  Game.count() == page.all("#games").size() - 1
end
