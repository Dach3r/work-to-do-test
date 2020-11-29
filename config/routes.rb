Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, defaults: { format: :json }, controllers: {
    sessions: 'v1/auth/sessions',
    registrations: 'v1/auth/registrations',
    passwords: 'v1/auth/passwords'
  }

  scope "(:locale)", locale: /en|es/ do
    namespace :v1 do
      resources :categories, only: %w[index create]
      resources :projects, only: %w[create update show] do
        member do
          get :pending
          get :users

          post :add_user
        end

        resources :tasks, only: %w[index show create update] do
          resources :subtasks, only: :create
          put :update_status, on: :member
        end
      end
    end
  end
end
