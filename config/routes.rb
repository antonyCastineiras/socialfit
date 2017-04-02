Rails.application.routes.draw do
  get 'replies/create'

  get 'replies/index'

  get 'messages/create'

  get 'notifications/index'

  get 'invites/accept'

  get 'invites/reject'

  devise_for :users, controllers: {
  	registrations: 'registrations',
  	sessions: 'sessions'
  }

  get 'users/notifications/index' => 'notifications#index', as: 'user_notifications'
  get 'notifications/get' => 'notifications#get'

  get 'users/:user_id/friendships' => 'friendships#index', as: 'user_friendships' 
  get 'users/events' => 'events#index', as: 'user_events' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/home' => 'pages#home', as: 'user_home'
  
  resources :events do 
    post '/messages/create' => 'messages#create'
    get '/messages/index' => 'messages#index'
  end

  resources :messages, only: [:index, :update] do
    resources :replies, only: [:create, :index]
  end

  get 'messages/get' => 'messages#get'
  get 'replies/get' => 'replies#get'

  get 'events/join/:id' => 'events#join', as: 'join_event'
  get 'update_calendar' => 'events#update_calendar', as: 'update_calendar_events'
  get 'users/update_events' => 'events#update_events', as: 'update_events'
  resources :invites, only: [:create]

  post 'invites/:id/accept' => 'invites#accept', as: 'accept_invite'
  post 'invites/:id/reject' => 'invites#reject', as: 'reject_invite'

  post 'friendships' => 'friendships#create'
  post 'friendships/accept/:id' => 'friendships#accept', as: 'accept_friend_request'
  post 'friendships/reject/:id' => 'friendships#reject', as: 'reject_friend_request'
  delete 'friendships/remove/:id' => 'friendships#remove', as: 'remove_friendship'
end 
