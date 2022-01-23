Rails.application.routes.draw do
  root "categories#index"
  resources :photos do
    resources :comments
  end
  resources :categories do 
    resources :comments
  end
  resources :comments do
    resources :comments
  end

  get "/search", to: "photos#search"
  get "/search_results", to: "photos#search_results"
end
