Rails.application.routes.draw do


	#HOME ROUTES --------------------------------------
	devise_for :users, :controllers => { :registrations => "registrations" }

	root "posts#index"

	#for the contact us form
	resources :contacts, only: [:create, :index]

	#POSTS, COMMENT & TAGS ROUTES ----------------------------------------
	resources :posts do
		resources :comments
		resources :favorites, only: [:create, :update, :destroy]
		resources :tags, only: [:create, :show]
	end

	#admin backend
	namespace :admin do
		resources :users
	end

	#from delayed_job_web GEM-----------------------------------------
	match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

	#use this route to display your favorites
	resources :favorites, only: [:index]

	#use this route to display posts relating to tags
	resources :tags, only: [:show], as: :tag

	#use this route to display posts belonging to a specific author
	get "/author/posts/:user_id" => "authors#show", as: :author_posts


end
