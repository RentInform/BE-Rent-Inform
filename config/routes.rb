Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      get '/search', to: 'properties#search' #are we ok with this not being a RESTful route? should it be `properties_search#show`?
    end
  end
end
