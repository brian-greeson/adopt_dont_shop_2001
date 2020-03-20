Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/shelters', to: 'shelter#index'
  get 'shelters/new', to: 'shelter#new'
  get '/shelters/:id', to: 'shelter#show'

  post '/shelters', to: 'shelter#create'
  get '/shelters/:id/edit', to: 'shelter#edit'
  patch '/shelters/:id', to: 'shelter#update'
  delete '/shelters/:id', to: 'shelter#destroy'
end
