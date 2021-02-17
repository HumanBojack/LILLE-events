Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :users
  resources :events do
  	resources :attendances
  	scope '/attendances' do
  		post 'create', to: 'attendances#create'
  		get 'success', to: 'attendances#success'
  		get 'cancel', to: 'attendances#cancel'
  	end
	end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
