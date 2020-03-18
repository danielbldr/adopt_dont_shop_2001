Rails.application.routes.draw do
  get '/', to:'welcome#index'
  get '/shelters', to:"shelters#index"
end
