Rails.application.routes.draw do
  get 'items/index'

  get 'items/show'

  get 'items/edit'

  get 'items/new'

  root 'home#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :buckets do
    resources :items
  end
end
