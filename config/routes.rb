Softmarks::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:update]

  resources :topics do
  	resources :bookmarks
  end
  
  resources :bookmarks, only: [:index] do
    resources :like_bookmarks, only: [:create, :destroy]
  end

  get "welcome/index"
  get "welcome/about"
 
  root to: 'welcome#index'
  #root to: 'devise/registrations#new'

end
