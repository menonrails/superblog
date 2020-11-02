Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :v1, path: '/api/v1' do
    resources :users
    resources :posts do
      resources :comments
    end
  end
end
