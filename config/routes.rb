Rails.application.routes.draw do
  root 'teams#index'
  resources :teams do
    resources :players do
      resources :hits, :only => [:create, :destroy]
    end
  end
end
