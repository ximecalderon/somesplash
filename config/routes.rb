Rails.application.routes.draw do
  resources :photos, except: :destroy
  resources :categories, except: :destroy
  # get "/search", to "photos#search"
end
