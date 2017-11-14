Rails.application.routes.draw do
  resources :rooms
  resources :devices

  resources :luminosities
  resources :humidities
  resources :temperatures
  resources :audios

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }


  root 'static_pages#home'

  get '/profile' => 'static_pages#profile', :as => 'profile'
  get '/control' => 'static_pages#control', :as => 'control'

end

