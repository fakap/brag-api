Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # USERS
      get    '/users'          => 'users#index'
      post   '/users'          => 'users#create'
      get    '/user/:username' => 'users#show'
      put    '/user/:id'       => 'users#update'
      delete '/user/:id'       => 'users#destroy'

      # SESSIONS
      post   '/sign_in' => 'authentications#create'

      # BRAGS
      get    '/user/:id/brags' => 'brags#index'
      post   '/user/:id/brags' => 'brags#create'
      get    '/brag/:id'       => 'brags#show'
      put    '/brag/:id'       => 'brags#update'
      delete '/brag/:id'       => 'brags#destroy'

      # WOWS
      get    '/brag/:id/wows' => 'wows#index'
      put    '/brag/:id/wow'  => 'wows#update'

      # COMMENTS
      get    '/brag/:id/comments' => 'comments#index'
      post   '/brag/:id/comments' => 'comments#create'
      delete '/comment/:id'       => 'comment#destroy'
    end
  end
end
