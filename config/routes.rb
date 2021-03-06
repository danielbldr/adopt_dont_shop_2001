Rails.application.routes.draw do
  get '/', to:'welcome#index'

  get '/shelters', to: "shelters#index"
  get '/shelters/new', to: "shelters#new"
  get '/shelters/:id/edit', to: "shelters#edit"
  get '/shelters/:id', to: "shelters#show"
  patch '/shelters/:id', to: "shelters#update"
  post '/shelters', to: "shelters#create"
  delete '/shelters/:id', to: "shelters#destroy"

  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  get '/pets/:id/edit', to: "pets#edit"
  patch '/pets/:id', to: "pets#update"
  delete '/pets/:id', to: "pets#destroy"

  get '/shelters/:shelter_id/pets', to: 'shelter_pets#index'
  get '/shelters/:shelter_id/pets/new', to: 'shelter_pets#new'
  post '/shelters/:shelter_id/pets', to: 'shelter_pets#create'
end
