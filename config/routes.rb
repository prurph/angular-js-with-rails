Receta::Application.routes.draw do
  root 'home#index'

  resources :recipes, except: [:edit, :new]
 end
