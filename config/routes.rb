Softmarks::Application.routes.draw do
  devise_for :users
  resources :users, only: [:update]
  get "welcome/index"
  get "welcome/about"
 
  root to: 'welcome#index'
  #root to: 'devise/registrations#new'
end
