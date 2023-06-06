require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v0 do
      get '/search', to: 'properties#search'
      get '/user_properties', to: 'user_properties#index'
      get '/user_property', to: 'user_properties#show'
      post '/user_property', to: 'user_properties#create'
      delete '/user_property', to: 'user_properties#destroy'
    end
  end
end
