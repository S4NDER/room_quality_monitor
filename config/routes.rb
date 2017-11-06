Rails.application.routes.draw do
  resources :rooms
  resources :devices
  resources :luminosities
  resources :humidities
  resources :temperatures
  resources :audios
  get 'static_pages/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
