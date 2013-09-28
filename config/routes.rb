CvBe::Application.routes.draw do
  
  resources :tags


  resources :screams
  resources :instagram_services
  resources :twitter_services


  root to: "cms/pages#index"
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
  end
end
