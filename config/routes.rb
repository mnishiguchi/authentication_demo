Rails.application.routes.draw do
  resources :registrations
  resources :users
  get 'static_pages/home'
  root 'static_pages#home'
end
