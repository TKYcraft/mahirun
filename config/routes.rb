Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#delete'

  # Defines the root path route ("/")
  namespace :discordbot do
    namespace :api do
      namespace :v1 do
        resources :servers, only: [:show]
      end
    end
  end

  # namespace :minecraft do
  #   namespace :api do
  #     namespace :v1 do
  #     end
  #   end
  # end
end
