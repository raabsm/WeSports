# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


players = [{:username => 'Joe Shmoe', :email => 'joeshmo@gmail.com'},
					 {:username => 'Random Person', :email => 'rando@columbia.edu'},
					 {:username => 'Another Rando', :email => 'rando2@columbia.edu'}
]

players.each do |player|
	p = Player.create!(player)
end

games = [{:sport_name => 'Bowling', :zipcode => '10000', :slots_to_be_filled => 3, :game_start_time => '31-Oct-2021 15:03:00'},
				 {:sport_name => 'Archery', :zipcode => '10021', :slots_to_be_filled => 10, :game_start_time => '1-Nov-2021 12:00:00'},
				 {:sport_name => 'Boxing', :zipcode => '10005', :slots_to_be_filled => 8, :game_start_time => '31-Oct-2021 08:00:00', :game_end_time => '31-Oct-2021 10:00:00'},
         {:sport_name => 'Running', :zipcode => '90005', :slots_to_be_filled => 4, :game_start_time => '31-Oct-2021 15:03:00'},
]

games.each do |game|
  g = Game.create!(game)
  g.owning_player = Player.first
  g.save()
  g.players << Player.first
  g.players << Player.second
end



