Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasklists, except: :show do
    resources :tasks do
      put 'complete', on: :member
      put 'incomplete', on: :member
      put 'urgent', on: :member
      put 'normal', on: :member
    end
  end

end
