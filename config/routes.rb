Rails.application.routes.draw do
  root 'question#start'
  resources :question

  post '/result', to: 'question#result', as: 'result'
  get 'start', to: 'question#start', as: 'start'

  # match '*unmatched', to: 'application#not_found_method', via: :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
