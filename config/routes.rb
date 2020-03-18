Rails.application.routes.draw do
  get '/', to:'welcome#index'
  get '/shelters', to: "shelters#index"
  get '/shelters/:id', to: "shelters#show"
end
