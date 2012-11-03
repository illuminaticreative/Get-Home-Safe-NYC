GetHomeSafeNyc::Application.routes.draw do
  resources :locations
  post "/search" => "locations#search"
  get "/terms" => "welcome#terms"
  get "/press" => "welcome#press"
  root :to => 'locations#index'
end
