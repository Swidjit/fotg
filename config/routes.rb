Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations", omniauth_callbacks: 'omniauth_callbacks' }

  resources 'free-online-typing-games', :as =>:games, :controller => :games, :only => [:index,:show] do
    member do
      post 'save_score'
      get 'init_score'
    end
  end

  resources 'wpm-typing-tests', :as =>:wpm_tests ,:controller => :wpm_tests, :only => [:index,:show] do
    member do
      post 'save_score'
      get 'init_score'
    end
  end

  resources 'free-typing-games', :as=>:other_games, :controller=> :other_games, :only => [:index,:show]

  resources :users, :only => [:show] do
    member do
      get 'stats'
    end
  end

  resources 'kids-games', :as=> :other_games, :controller => :kids_games, :only => [:index,:show]

  resources :comments, :only => [:create, :destroy]

  root :to => 'pages#home'
  get 'free-typing' => 'games#index'
  get 'typing-test' => 'wpm_tests#index'
  get '/:page_name' => 'pages#index', :as => :pages

  get 'kids-typing/:game' => 'other_games#show'
  get 'typing-games-for-kids/:game' => 'kids_games#index'


  get 'typing-news/:title' => 'typing_news#index'
  get 'miscellaneous-typing-news/:title' => 'typing_news#index'

  get 'typing-resources/:title' => 'typing_resources#index'
  get 'more-typing-practice/:title' => 'typing_resources#index'
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  get 'sitemap.xml' => 'sitemap#index', as: 'sitemap', defaults: { format: 'xml' }

end
