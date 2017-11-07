Rails.application.routes.draw do
  resources :rooms
  resources :devices
  resources :luminosities
  resources :humidities
  resources :temperatures
  resources :audios



  root 'static_pages#home'

end
