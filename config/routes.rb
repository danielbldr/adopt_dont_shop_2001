Rails.application.routes.draw do
  get '/', to:'welcome#index'

  get '/shelters', to: "shelters#index"
  get '/shelters/new', to: "shelters#new"
  get '/shelters/:id/edit', to: "shelters#edit"
  get '/shelters/:id', to: "shelters#show"
  patch '/shelters/:id', to: "shelters#update"
  post '/shelters', to: "shelters#create"
  delete '/shelters/:id', to: "shelters#destroy"
end
