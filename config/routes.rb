Rails.application.routes.draw do
  resources :chart_by_device_types
  resources :rooms
  resources :devices

  resources :luminosities
  resources :humidities
  resources :temperatures
  resources :audios
  resources :controls

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root 'static_pages#home'

  get '/profile' => 'static_pages#profile', :as => 'profile'


end

