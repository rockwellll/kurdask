Rails.application.routes.draw do
  resources :questions, param: :title
  resources :answers

  devise_for :users, param: :username do
    get '/:username', to: 'users#show'

  end

  post '/question/answer', to: 'questions#answer', as: 'answer_question'
  post '/upvote', to: 'up_vote#store', as: 'upvote'
  post '/downvote', to: 'downvote#store', as: 'downvote'

  get '/users/:username', to: 'users#show', as: 'user_show'
  get '/users/:username/edit', to: 'users#edit', as: 'user_edit'
  delete 'users/:username', to: 'users#destroy', as: 'destroy_user'
  patch 'users/:username', to: 'users#update'

  root "questions#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
