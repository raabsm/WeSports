# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


games = [{:sport_name => 'Bowling', :zipcode => '10000', :slots_to_be_filled => 2, :slots_taken => 2, :game_start_time => '31-Oct-2021 15:03:00'},
				 {:sport_name => 'Archery', :zipcode => '10021', :slots_to_be_filled => 10, :slots_taken => 3, :game_start_time => '1-Nov-2021 12:00:00'},
				 {:sport_name => 'Boxing', :zipcode => '10005', :slots_to_be_filled => 8, :slots_taken => 1, :game_start_time => '31-Oct-2021 08:00:00', :game_end_time => '31-Oct-2021 10:00:00'},
         {:sport_name => 'Running', :zipcode => '90005', :slots_to_be_filled => 4, :slots_taken => 4, :game_start_time => '31-Oct-2021 15:03:00'},
]

games.each do |game|
  Game.create!(game)
end

players = [{:username => 'Sam', :email => 'smr2218@columbia.edu'},
           {:username => 'Jenny', :email => 'jenny@columbia.edu'},
					 {:username => 'Tom', :email => 'Tom@columbia.edu'},
					 {:username => 'Steph', :email => 'Steph@columbia.edu'},
]

players.each do |player|
  Player.create!(player)
end

player_game = [{:player_id => 1, :game_id => 2},
							 {:player_id => 1, :game_id => 4},
							 {:player_id => 3, :game_id => 1},
]

player_game.each do |pair|
	PlayerGame.create!(pair)
end