Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/auth/register', to: 'users#register'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Conversations
  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:index], controller: "messages"
  end

  # Messages
  resources :messages, only: [:create]
  put "messages/:id/read", to: "messages#mark_read", as: :mark_message_read

  # Defines the root path route ("/")
  # root "posts#index"
end