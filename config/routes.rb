Rails.application.routes.draw do


	#HOME ROUTES --------------------------------------
	devise_for :users, :controllers => { :registrations => "registrations" }

	root "posts#index"
	#get "/about" => "home#about", as: :about
	#get "/contact" => "home#contact", as: :contact
	resources :contacts, only: [:create, :index]

	#POSTS, COMMENT & TAGS ROUTES ----------------------------------------
	resources :posts do
		resources :comments
		resources :favorites, only: [:create, :update, :destroy]
		resources :tags, only: [:create, :show]
	end

	namespace :admin do
		resources :users
	end

	#this will list the posts only created by that user
	get "/posts/:user_id" => "posts#your_posts", as: :your_posts

	#from delayed_job_web GEM-----------------------------------------
	match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

	#use this route to display your favorites
	#defined current_user favorites in the favorites controller
	resources :favorites, only: [:index]

	#use this route to display posts relating to tags
	resources :tags, only: [:show], as: :tag

	#use this route to display posts belonging to a specific author
	get "/author/posts/:user_id" => "authors#show", as: :author_posts


end
