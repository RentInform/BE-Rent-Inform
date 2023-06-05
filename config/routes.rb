Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      get '/search', to: 'properties#search'
      get '/user_properties', to: 'user_properties#index'
    end
  end
end
