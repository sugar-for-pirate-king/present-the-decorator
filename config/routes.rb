Rails.application.routes.draw do
  get 'users/show'
  resources :users, only: %i[show]
end
