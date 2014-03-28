NkuRails::Application.routes.draw do
  resources :attendances
  resources :sessions
  resources :students, except: :edit do
    resources :attendances
    resources :assignments
  end
  resources :assignments do
    collection { post :import }
  end

  get "sign_out", to: "sessions#destroy"
  get "profile", to: "students#edit"
  get "abcenses", to: "students#abcense"
  post "students/setDate", to: "students#setDate"
  root to: "students#index"
end
