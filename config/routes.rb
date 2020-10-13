Rails.application.routes.draw do
  resources :questions, param: :title
  resource :users
  devise_for :users

  post '/question/answer', to: 'questions#answer', as: 'answer_question'
  post '/upvote', to: 'up_vote#store', as: 'upvote'
  post '/downvote', to: 'downvote#store', as: 'downvote'
  get '/users/:username', to: 'users#show', as: 'user_show'

  root "questions#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
