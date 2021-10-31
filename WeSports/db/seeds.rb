# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

games = [{:sport_name => 'Spikeball', :zipcode => '10027', :slots_to_be_filled => 4, :slots_taken => 2, :game_start_time => '31-Oct-2021 15:03:00'},
				 {:sport_name => 'Basketball', :zipcode => '10027', :slots_to_be_filled => 10, :slots_taken => 1, :game_start_time => '1-Nov-2021 12:00:00'},
				 {:sport_name => 'Baseball', :zipcode => '10025', :slots_to_be_filled => 20, :slots_taken => 1, :game_start_time => '5-Nov-2021 19:30:00'},
				 {:sport_name => 'Soccer', :zipcode => '10027', :slots_to_be_filled => 8, :slots_taken => 1, :game_start_time => '31-Oct-2021 08:00:00', :game_end_time => '31-Oct-2021 10:00:00'},
]

games.each do |game|
  Game.create!(game)
end