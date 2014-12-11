Softmarks::Application.routes.draw do
  resources :topics

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:update]
  get "welcome/index"
  get "welcome/about"
 
  root to: 'welcome#index'
  #root to: 'devise/registrations#new'

end
