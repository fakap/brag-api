Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get    '/users'    => 'users#index'
      post   '/users'    => 'users#create'
      get    '/user/:id' => 'users#show'
      put    '/user/:id' => 'users#update'
      delete '/user/:id' => 'users#destroy'
    end
  end
end
