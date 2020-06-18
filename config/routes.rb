Rails.application.routes.draw do
  root to: "application#welcome"
  
  resources :categories do
    resources :recipes, only: [:index, :show, :new]
  end
  resources :recipes

  devise_for :users, :controllers => {:registrations => 'registrations', :omniauth_callbacks => "callbacks" }

  devise_scope :user do 
    get "/login", to: "devise/sessions#new"
    get "/signup", to: "devise/registrations#new"
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
