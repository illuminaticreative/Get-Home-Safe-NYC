GetHomeSafeNyc::Application.routes.draw do
  resources :locations
  post "/search" => "locations#search"
  root :to => 'locations#index'
end
