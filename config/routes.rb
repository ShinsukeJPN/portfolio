Rails.application.routes.draw do
  devise_for :admins, :controllers => {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions',
    :passwords => 'admins/passwords'
  }

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :omniauth_callbacks => 'users/omniauth_callbacks' }

    # 管理者側ページへ名前空間設定：admin
  namespace :admin do
    get '/top', to: 'tops#top'

    resources :users, only: [:index, :show, :destroy, :restore]
    get 'admin/users/:id/restore' => 'users#restore', as: 'user_restore' # 論理削除で退会させた人を復元させる

    resources :reports, only: [:index, :destroy]
    resources :messages, only: [:index]
  end

    # 論理削除後にログイン状態を維持してしまうので、強制ログアウトを行う
  devise_scope :user do
    get '/logout', to: 'users/sessions#destroy', as: "logout"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#top'
  get '/rules' => 'abouts#rules'
  post '/teacher_requests' => 'requests#create_2'

	resources :users do
    resources :requests, shallow: true, only: [:index, :update, :destroy]
    resources :reports, except: [:edit, :destroy]
    resources :rooms, shallow: true
    resources :reservations, shallow: true
    resources :students, shallow: true, except: [:index] do
      resource :favorites, only: [:create, :destroy]
      resource :requests, only: [:create]
    end
  	resources :teachers, shallow: true, except: [:index] do
 		  resource :favorites, only: [:create, :destroy]
      resource :requests, only: [:create]
    end
  end

  resources :rooms, except: [:index] do
    resources :messages, shallow: true, except: [:edit]
  end

  resources :students, only: [:index]
  resources :teachers, only: [:index]

end