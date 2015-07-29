Rails.application.routes.draw do
  resources :poptarts, only: [:index, :show, :create, :update]
end
