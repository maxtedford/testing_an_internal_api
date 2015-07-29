Rails.application.routes.draw do
  resources :poptarts, only: [:index]
end
