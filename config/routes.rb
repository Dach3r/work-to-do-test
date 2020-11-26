Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, defaults: { format: :json }, controllers: {
    sessions: 'v1/auth/sessions',
    registrations: 'v1/auth/registrations',
    passwords: 'v1/auth/passwords'
  }

  namespace :v1 do
    resources :projects, only: %w[create update show] do
      get :pending, on: :member

      resources :tasks, only: %w[index show create update] do
        put :update_status, on: :member
      end
    end
  end
end
