Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :users do
    resources :groups do
      resources :activities
    end
  end

  get '/icons', to: 'icon_selection#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
