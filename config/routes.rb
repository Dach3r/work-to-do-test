Rails.application.routes.draw do

  root 'home#index'

  devise_for :users, defaults: { format: :json }, controllers: {
    sessions: 'v1/auth/sessions',
    registrations: 'v1/auth/registrations',
    passwords: 'v1/auth/passwords'
  }

end
