Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  resources :posts do
    collection do
      post :confirm
    end
  end
end
