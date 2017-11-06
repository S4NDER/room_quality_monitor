Rails.application.routes.draw do
  resources :rooms
  resources :devices
  resources :audios
  resources :tempertures
  resources :humidities
  resources :luminosities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
