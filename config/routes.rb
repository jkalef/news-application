Rails.application.routes.draw do

	#HOME ROUTES --------------------------------------
	root "home#index"
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
	end

end
