# WeSports

Member 1 Name: Jenny Martinez
Member 1 UNI: jm4607
Member 2 Name: Stephane Meunier
Member 2 UNI: sjm2264
Member 3 Name: Samuel Raab
Member 3 UNI: smr2218
Member 4 Name: Tanay Murdia
Member 4 UNI: tm3149

Run program locally
1. bundle install --without production
2. rake db:migrate
3. rake db:seed
4. rails server
--> This should automatically run on http://0.0.0.0:3000

To run tests on MacOS
1. rake db:migrate RAILS_ENV=test
2. bundle exec cucumber features/search_sport.feature 

https://enigmatic-bastion-69608.herokuapp.com/ 

https://github.com/raabsm/WeSports

Features
Pages
	Index 
		Table with games
		More info buttons on every game (redirect to game description)
		Filter for available only games
		Filter section (search bar for name and zip code)
		Create a game button (redirect to create page)
	Game Description 
		Table with game description (location/sport/college etc)
		Join button (if slots are available)
		Back button (redirect to index)
	Create (Where users can create event)
		Form with game description for user to fill
		Add game to the list of games table
		Create button (redirects to game description of the game created)
	Edit Game Page
		Form to edit different attributes
