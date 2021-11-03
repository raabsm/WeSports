Wesports::Application.routes.draw do
  resources :games
  root :to => redirect('/games')
  get 'join_game/:id' => 'games#join', as: :join_game
end