Rails.application.routes.draw do


	#HOME ROUTES --------------------------------------
	devise_for :users, :controllers => { :registrations => "registrations" }

	root "posts#index"
	get "/about" => "home#about", as: :about
	get "/contact" => "home#contact", as: :contact


	#POSTS & COMMENT ROUTES ----------------------------------------
	# get '/posts' => "posts#index"
	# get '/posts/new' => "posts#new", as: :new_post
	# post '/posts/' => "posts#create"
	# get '/posts/:id' => "posts#show", as: :post
	# get '/posts/:id/edit' => "posts#edit", as: :edit_post
	# patch '/posts/:id' => 'posts#update'
	# delete '/posts/:id' => 'posts#destroy'
	resources :posts do
		resources :comments
		resources :favorites, only: [:create, :update, :destroy]
		resources :tags, only: [:create]
	end

	#this will list the posts only created by that user
	get "/posts/:user_id" => "posts#your_posts", as: :your_posts

	#from delayed_job_web GEM-----------------------------------------
	match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

	resources :favorites, only: [:index]

end
