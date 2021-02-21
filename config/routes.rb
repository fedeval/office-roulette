Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :roulette, only: [:index] do
    resources :user_badges, only: [:new, :create]
  end
  resources :dashboard, only: [:index]

  resources :video_rooms, only: [:create, :show]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  mount ActionCable.server => "/chatrooms"
end
