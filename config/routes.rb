Rails.application.routes.draw do

	#HOME ROUTES --------------------------------------
	#this will be the root page for now
	root "home#index"

	#route for the about us page in the home controller
	get "/about" => "home#about", as: :about

	#route for the contact page in the home controller
	get "/contact" => "home#contact", as: :contact

	#------------------------------------------------------


	#POSTS ROUTES ----------------------------------------
	#list page for all the posts
	get '/posts' => "posts#index"
	get '/posts/new' => "posts#new", as: :new_post
	post '/posts/' => "posts#create"
	get '/posts/:id' => "posts#show", as: :post
	get '/posts/:id/edit' => "posts#edit", as: :edit_post
	patch '/posts/:id' => 'posts#update'
	delete '/posts/:id' => 'posts#destroy'
	#resources :posts

	#------------------------------------------------------


	#COMMENTS ROUTES --------------------------------------
	resources :comments


 	#------------------------------------------------------

end
