# WeSports

<b>Members</b></br>
Member 1 Name: Jenny Martinez</br>
Member 1 UNI: jm4607</br>
Member 2 Name: Stephane Meunier</br>
Member 2 UNI: sjm2264</br>
Member 3 Name: Samuel Raab</br>
Member 3 UNI: smr2218</br>
Member 4 Name: Tanay Murdia</br>
Member 4 UNI: tm3149</br>

Run program locally
1. bundle install --without production
2. rake db:migrate
3. rake db:seed
4. rails server
5. In order for WeSports to function run on http://localhost:3000/

Heroku: https://wesports-app.herokuapp.com/

Github: https://github.com/raabsm/WeSports

Pages </br>
	<b>1. Login </br></b>
		Sign in botton (redirects to google oauth) </br>
	<b>2. Index </br></b>
		Table with games available </br>
		More info buttons on every game (redirect to game description) </br>
		Filter for available only games </br>
		Filter section (search bar for name and zip code) </br>
		Sort by Sport Name and Start Time </br>
		Create a game button (redirect to create page) </br>
		View Profile Page </br>
	<b>3. Game Description </br></b>
		View game description (location/sport/college etc) </br>
		View players that have join the game </br>
		Join button (if slots are available) </br>
		Delete game (if user is the owner) </br>
		Back button (redirect to index) </br>
	<b>4. Create (Where users can create event) </br></b>
		Form with game description for user to fill </br>
		Add game to the list of games table </br>
		Create button (redirects to game description of the game created) </br>
	<b>5. Edit Game Page </br></b>
		Form to edit different attributes </br>
	<b>6. Profile Page </br></b>
		Table with games that user joined </br>
		Table with games that user created </br>
		Back button (redirect to index) </br>
