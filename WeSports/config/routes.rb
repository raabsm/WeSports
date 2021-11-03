Wesports::Application.routes.draw do
  resources :games
  root :to => redirect('/games')
end