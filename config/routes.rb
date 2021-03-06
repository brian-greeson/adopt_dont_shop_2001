Rails.application.routes.draw do
  get '/shelters', to: 'shelters#index'

  get '/shelters/new', to: 'shelters#new'

  post '/shelters/create', to: 'shelters#create'

  get '/shelters/:id', to: 'shelters#show', as: 'show_shelters'

  get '/shelters/:id/edit', to: 'shelters#edit'

  put '/shelters/:id/update', to: 'shelters#update'

  delete '/shelters/:id', to: 'shelters#destroy', as: 'delete_shelters'

  get '/pets', to: 'pets#index'

  get '/pets/:id', to: 'pets#show'

  get '/shelters/:id/pets', to: 'pets#shelter_pets'

  get '/shelters/:id/pets/new', to: 'pets#new'

  post '/shelters/:shelter_id/pets', to: 'pets#create'

  get '/pets/:id/edit', to: 'pets#edit', as: 'edit_pets'

  patch '/pets/:id', to: 'pets#update', as: 'update_pets'

  delete '/pets/:id', to: 'pets#destroy', as: 'delete_pets'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'shelters#index'
end
