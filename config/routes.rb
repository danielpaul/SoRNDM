Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#landing'

  #League Of Legends
  get '/league', to: 'league_of_legends#index'
  get '/league/champion', to: 'league_of_legends#champion'
end
