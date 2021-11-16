Rails.application.routes.draw do
  resources :comments_details
  resources :host_details
  resources :event_details
  resources :user_details
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
