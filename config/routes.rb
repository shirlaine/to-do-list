Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tasklists#index"
  resources :tasklists, except: :show do
    resources :tasks do
      put 'complete', on: :member
      put 'incomplete', on: :member
      put 'urgent', on: :member
      put 'normal', on: :member
    end
  end

end
