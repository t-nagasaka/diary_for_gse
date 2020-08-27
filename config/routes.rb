Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  get "/contact", to: "homes#contact"
  get "/question", to: "homes#question"
  resources :users
  resources :diaries
end
