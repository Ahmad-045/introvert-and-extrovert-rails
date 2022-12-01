Rails.application.routes.draw do
  root 'question#index'
  resources :question

  post '/add_result', to: 'question#add_result', as: 'add_result'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
