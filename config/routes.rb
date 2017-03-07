Rails.application.routes.draw do
  get 'invites/accept'

  get 'invites/reject'

  devise_for :users, controllers: {
  	registrations: 'registrations',
  	sessions: 'sessions'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/home' => 'pages#home', as: 'user_home'

  resources :events
  resources :invites, only: [:create]

  post 'invites/:id/accept' => 'invites#accept', as: 'accept_invite'
  post 'invites/:id/reject' => 'invites#reject', as: 'reject_invite'
end 
