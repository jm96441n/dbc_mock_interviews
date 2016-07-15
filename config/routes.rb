Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'users#show'
  get 'users/:id' => 'users#show'
  get 'interviews/:id' => 'interview#show'
  resources :upcomings, only: [:new,:create]

end
