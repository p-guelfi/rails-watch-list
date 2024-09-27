Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  get 'lists/index'
  get 'lists/show'
  get 'lists/new'
  get 'lists/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "lists#index"
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end

# Root path
# get "/", to: "lists#index", as: :root

# Lists routes
# get "/lists", to: "lists#index", as: :lists         # Lists index (view all lists)
# get "/lists/new", to: "lists#new", as: :new_list    # Form for creating a new list
# post "/lists", to: "lists#create"                   # Action to create a new list
# get "/lists/:id", to: "lists#show", as: :list

# Nested routes for bookmarks
# get "/lists/:list_id/bookmarks/new", to: "bookmarks#new", as: :new_list_bookmark
# post "/lists/:list_id/bookmarks", to: "bookmarks#create"

# delete "/bookmarks/:id", to: "bookmarks#destroy", as: :bookmark
