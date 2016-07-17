Rails.application.routes.draw do
  devise_for :users, :controllers => { 
  	registrations: 'registrations', 
  	confirmations: 'confirmations'
  }
  root 'users#show'
  get 'users/:id' => 'users#show'
  resources :interviews, only: :show
  resources :upcomings, only: [:new,:create]
  delete 'upcomings/:id' => 'upcomings#destroy', as: "upcoming_destroy"

end
