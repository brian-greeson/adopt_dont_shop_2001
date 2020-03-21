Rails.application.routes.draw do
  get '/shelters', to: 'shelters#index'

  get '/shelters/new', to: 'shelters#new'

  post '/shelters/create', to: 'shelters#create'

  get '/shelters/:id', to: 'shelters#show'

  get '/shelters/:id/edit', to: 'shelters#edit'

  put '/shelters/:id/update', to: 'shelters#update'

  delete '/shelters/:id', to: 'shelters#destroy'

  get '/pets', to: 'pets#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
end
