Wesports::Application.routes.draw do
  resources :games
  get 'games/:id/join', to: 'games#join', as: :join_game
  root :to => redirect('/games')
end