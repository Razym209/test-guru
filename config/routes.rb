Rails.application.routes.draw do
  root 'main#index'

  devise_for :users,
             path: :gurus,
             path_names: {
               sign_in: :login,
               sign_out: :logout
             },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  get :admin, to: "admin/home#index"
  namespace :admin do
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
  end
end
