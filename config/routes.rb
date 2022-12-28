Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    get 'users/all', as: 'all_users'
    devise_for :users
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    resources :articles do
      resources :comments
    end
    root 'articles#index'
    post 'delete', to: 'users#delete'
    # Defines the root path route ("/")
    # root "articles#index"
  end
end
