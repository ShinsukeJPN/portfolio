Rails.application.routes.draw do
  get 'rooms/show'

  devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#top'
  get '/rules' => 'tops#rules'
  get '/about' => 'tops#about'
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