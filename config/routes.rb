Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  get "/contact", to: "homes#contact"
  resources :users
  resources :diaries
end
