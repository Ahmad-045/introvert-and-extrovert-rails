Rails.application.routes.draw do
  root 'question#start'
  resources :question

  post '/result', to: 'question#result', as: 'result'
  get 'start', to: 'question#start', as: 'start'

end
