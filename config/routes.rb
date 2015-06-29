Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations", omniauth_callbacks: 'omniauth_callbacks' }

  resources :games, :only => [:index,:show] do
    member do
      post 'save_score'
      get 'init_score'
    end
  end

  resources :wpm_tests, :only => [:index,:show] do
    member do
      post 'save_score'
      get 'init_score'
    end
  end

  resources :other_games, :only => [:index,:show]

  resources :users, :only => [:show] do
    member do
      get 'stats'
    end
  end

  resources :comments, :only => [:create, :destroy]

  root :to => 'pages#home'
  get 'pages/:page_name' => 'pages#index', :as => :pages
  get 'free-typing-games/:game' => 'other_games#show'
  get 'kids-typing/:game' => 'other_games#show'
  get 'wpm-typing-tests/:id' => 'wpm_tests#show'
  get 'typing-news/:title' => 'typing_news#index'
  get 'typing-resources/:title' => 'typing_resources#index'
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  get 'sitemap.xml' => 'sitemap#index', as: 'sitemap', defaults: { format: 'xml' }

end
