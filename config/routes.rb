Rails.application.routes.draw do
  root to: "home#index"
  get "/pages/:page" => "pages#show"
  get "/search" => "players#search"
  resources :players, only: %i[index show search]
  resources :teams, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
