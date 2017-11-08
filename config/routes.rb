Rails.application.routes.draw do
  resources :rooms
  resources :devices
  resources :luminosities
  resources :humidities
  resources :temperatures
  resources :audios

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'static_pages#home'
  get '/login' => 'static_pages#login', :as => 'login'

end

