Rails.application.routes.draw do
  namespace :groups do
    get 'searches/index'
  end
  root 'home#index'
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :groups do
      collection do
        post :search, to: "groups/searches#index"
      end
      resources :activities
    end
  end

  get '/icons', to: 'icon_selection#index'

end
