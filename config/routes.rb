Rails.application.routes.draw do
  get 'shelters', to: 'shelters#index'

  get 'shelters/create'

  get 'shelters/:id', to: 'shelters#show'

  get 'shelters/update'

  get 'shelters/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
end
