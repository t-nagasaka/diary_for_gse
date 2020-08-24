Rails.application.routes.draw do
  root "homes#top"
  resources :users
  resources :diaries
end
