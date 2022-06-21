Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'searches#index'

  get '/search', to: 'searches#search'

  #resource :searches, path_names: { new: 'search' }
end
