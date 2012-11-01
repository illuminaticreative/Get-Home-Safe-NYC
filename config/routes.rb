GetHomeSafeNyc::Application.routes.draw do
  resources :locations
  get "/search" => "locations#new"
  root :to => 'locations'
end
