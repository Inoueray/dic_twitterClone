Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blogs do
    collection do
  	  post :confirm
    end
  end
  get "/" ,to: "home#top"

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
