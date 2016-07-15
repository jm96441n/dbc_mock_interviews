Rails.application.routes.draw do
  devise_for :users
  get 'users/:id' => 'users#show'
  resources :registrations, only: [:new,:create]

end
