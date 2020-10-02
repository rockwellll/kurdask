Rails.application.routes.draw do
  resources :questions, param: :title
  devise_for :users

  root "questions#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
