Rails.application.routes.draw do
  root "Homes#top"
  resources :users
  resources :diaries
end
