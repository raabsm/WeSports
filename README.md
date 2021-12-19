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
5. In order for WeSports to function run on http://localhost:3000/

Heroku: https://wesports-app.herokuapp.com/

Github: https://github.com/raabsm/WeSports

Features </br>
Pages </br>
	1. Login </br>
		Sign in botton (redirects to google oauth) </br>
	2. Index </br>
		Table with games available </br>
		More info buttons on every game (redirect to game description) </br>
		Filter for available only games </br>
		Filter section (search bar for name and zip code) </br>
		Sort by Sport Name and Start Time </br>
		Create a game button (redirect to create page) </br>
		View Profile Page </br>
	3. Game Description </br>
		View game description (location/sport/college etc) </br>
		View players that have join the game </br>
		Join button (if slots are available) </br>
		Delete game (if user is the owner) </br>
		Back button (redirect to index) </br>
	4. Create (Where users can create event)
		Form with game description for user to fill </br>
		Add game to the list of games table </br>
		Create button (redirects to game description of the game created) </br>
	5. Edit Game Page </br>
		Form to edit different attributes </br>
	6. Profile Page </br>
		Table with games that user joined </br>
		Table with games that user created </br>
		Back button (redirect to index) </br>
