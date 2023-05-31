Rails.application.routes.draw do
  
  get 'reservations/index'
  #get 'rooms/index'
  #get 'users/home'
  root 'users#home'
  
  devise_for :users, 
              path: '', 
              path_names: {sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
              controllers: {registrations: 'registrations'}

  resources :users
  resources :rooms do
    collection do
      get 'own'
    end
  end

  resources :reservations do
    collection do
      post 'confirm' ,to: 'reservations#confirm'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
