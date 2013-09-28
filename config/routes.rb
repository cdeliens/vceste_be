CvBe::Application.routes.draw do
  resources :events
  resources :tags
  resources :screams
  resources :instagram_services
  resources :twitter_services
  root to: "cms/events#index"
  resources :pages do
    collection do
      get :find_by_category
    end
  end
  resources :posts do
    collection do
      get :find_by_category
    end
  end
  namespace :cms do
    root to: "pages#index"
    resources :base
    resources :posts
    resources :pages
    resources :tags
    resources :screams    
    resources :categories
    resources :events
    resources :places
  end
end
