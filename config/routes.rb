Rails.application.routes.draw do
  resources :rooms
  resources :devices
<<<<<<< HEAD
  resources :audios
  resources :tempertures
  resources :humidities
  resources :luminosities

  get 'static_pages/home'
=======
  resources :luminosities
  resources :humidities
  resources :temperatures
  resources :audios
  resources :fakes

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
>>>>>>> ddea7d137107c64b126df3195f9f214696888600

  root 'static_pages#home'

  get '/profile' => 'static_pages#profile', :as => 'profile'
  get '/control' => 'static_pages#control', :as => 'control'

end

