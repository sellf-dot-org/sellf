Rails.application.routes.draw do
  resources :purchases

  resources :blobs

  resources :accounts

  root to: 'sell#welcome', as: 'sell'
  get '/buy' => 'data#index', as: 'buy'

  resources :data do
    member do
      post :buy
      get :appraise
    end
  end

  resources :users do
    # resources :data
    member do
      post :pay
      post :subscribe
    end
  end

  resource :sessions do
    member do
      get :destroy, as: 'destroy'
    end
  end


  # docs
  get '/docs' => 'docs#index'
  get '/docs/facebook' => 'docs#facebook'


  # Stripe Connect endpoints
  #  - oauth flow
  get '/connect/oauth' => 'stripe#oauth', as: 'stripe_oauth'
  get '/connect/confirm' => 'stripe#confirm', as: 'stripe_confirm'
  get '/connect/deauthorize' => 'stripe#deauthorize', as: 'stripe_deauthorize'
  #  - create accounts
  post '/connect/managed' => 'stripe#managed', as: 'stripe_managed'
  post '/connect/standalone' => 'stripe#standalone', as: 'stripe_standalone'

  # Stripe webhooks
  post '/hooks/stripe' => 'hooks#stripe'
end
