Rails.application.routes.draw do
  root 'players#index'
  resources :players do
    resources :hits, :only => [:create, :destroy]
  end
end
