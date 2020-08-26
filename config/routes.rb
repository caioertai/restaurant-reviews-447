Rails.application.routes.draw do
  # get "/restaurants/new", to: "restaurants#new" # new
  # post "/restaurants", to: "restaurants#create" # create
  # get "/restaurants", to: "restaurants#index" # index
  # get "/restaurants/:id", to: "restaurants#show" # show
  # get "/restaurants/:id/edit", to: "restaurants#edit" # edit
  # patch "/restaurants/:id", to: "restaurants#update" # update
  # delete "/restaurants/:id", to: "restaurants#destroy" #destroy

  resources :restaurants do
    resources :reviews, only: [:new, :create]

    # "/restaurants" <---- collection
    get "top", on: :collection

    # "/restaurants/:id"
    get "chef", on: :member # "/restaurants/:id/chef"
  end

  # resources(:reviews, { only: [:destroy] })
  # resources(:reviews, only: [:destroy])
  resources :reviews, only: [:destroy]
end
