Rails.application.routes.draw do
  resources :todos

  namespace :api do
    namespace :v1 do
      resources :todos,  defaults: {format: :json} 
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
