Rails.application.routes.draw do
  root to: 'plants#index'

  resources :plants

  get "/leaves_search" => "plants#leaves_search"
  get "/cones_search" => "plants#index"
  get "/bark_search" => "plants#index"
  get "/branches_search" => "plants#index"
  get "/name_search" => "plants#index"
  get "/plants_search" => "plants#index"
end
