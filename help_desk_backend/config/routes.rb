Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/auth/register', to: 'users#register'

  get 'expert/queue', to: 'experts#queue'
  post 'expert/conversations/:conversation_id/claim', to: 'experts#claim'
  post 'expert/conversations/:conversation_id/unclaim', to: 'experts#unclaim'
  get 'expert/profile', to: 'experts#show'
  put 'expert/profile', to: 'experts#update'
  get 'expert/assignments/history', to: 'experts#history'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end