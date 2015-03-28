Rails.application.routes.draw do


#route for the root directoy
#the home controller will display all my static pages
root "home#index"


#route for the about us page in the home controller
get "/about" => "home#about", as: :about
get "/contact" => "home#contact", as: :contact


end
