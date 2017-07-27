Rails.application.routes.draw do
  root to: 'plants#index'

  resources :plants, only: [ :index, :show ]

  get "/leaves_search" => "plants#leaves_search"
  get "/name_search" => "plants#index"
  get "/plants_search" => "plants#index"
end
