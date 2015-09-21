Rails.application.routes.draw do

  #namespace :api do
  #  namespace :v1 do
  #    resources :employees, only: [:index, :create, :show, :update], :defaults => { :format => 'json' }
  #    resources :vacancies, only: [:index, :create, :show, :update], :defaults => { :format => 'json' }
  #    resources :skills
  #  end
  #end

  resources :skills
  resources :employees, :vacancies do
    resources :skills
  end

  root 'welcome#index'
end
