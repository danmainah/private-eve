Rails.application.routes.draw do
  resources :events
  resource :event_attendees, only:[:create]
  devise_for :users
  resources :users, only: [:show]
  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
