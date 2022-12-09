Rails.application.routes.draw do
  root 'question#index'
  resources :question

  post '/add_result', to: 'question#add_result', as: 'add_result'

  match '*unmatched', to: 'application#not_found_method', via: :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
