Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # USERS
      get    '/users'    => 'users#index'
      post   '/users'    => 'users#create'
      get    '/user/:id' => 'users#show'
      put    '/user/:id' => 'users#update'
      delete '/user/:id' => 'users#destroy'

      # SESSIONS
      post   '/sign_in'  => 'authentications#create'
    end
  end
end
