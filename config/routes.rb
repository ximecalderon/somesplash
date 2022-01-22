Rails.application.routes.draw do
  resources :photos do
    resources :comments
  end
  resources :categories do 
    resources :comments
  end
  resources :comments do
    resources :comments
  end
  # get "/search", to "photos#search"
end
