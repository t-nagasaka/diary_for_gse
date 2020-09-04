Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  get "/contact", to: "contacts#new"
  post "contact/confirm", to: "contacts#confirm"
  post "contact/back", to: "contacts#back"
  post "/contact", to: "contacts#create"
  get "/question", to: "homes#question"
  resources :contacts, only: [:new, :create]
  resources :users
  resources :diaries
end
