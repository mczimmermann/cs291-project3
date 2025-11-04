Rails.application.routes.draw do
  get "experts/queue"
  get "experts/claim"
  get "experts/unclaim"
  get "experts/show"
  get "experts/update"
  get "experts/history"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/auth/register', to: 'users#register'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end