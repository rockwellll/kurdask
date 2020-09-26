Rails.application.routes.draw do
  resources :questions
  devise_for :users
  get 'test/home'

  root "test#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
