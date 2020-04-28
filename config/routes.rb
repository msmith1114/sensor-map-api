Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      jsonapi_resources :devices
      jsonapi_resources :measurements
    end
  end
end