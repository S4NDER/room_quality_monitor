Rails.application.routes.draw do
  resources :rooms
  resources :devices
  resources :luminosities
  resources :humidities
  resources :temperatures
  resources :audios
  
  get 'static_pages/home'
  get 'control', to: 'static_pages#control'

  root 'static_pages#home'

end
