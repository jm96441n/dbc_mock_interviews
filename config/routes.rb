Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'users#show'
  get 'users/:id' => 'users#show'
  resources :upcomings, only: [:new,:create]

end
