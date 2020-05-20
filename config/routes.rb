Rails.application.routes.draw do
  get 'topics/index'
  get 'topics/show'
  get 'topics/edit'
  get 'topics/new'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 root 'subs#index'

resources :subs do
  resources :topics
end 
# this defines the 7 requests 
# get "/subs", to: "subs#index"
# get "subs/:id" to: "subs#show"
# delete "/subs/:id", to: "subs#destroy"
#http verb "url suffix", to: "controller#method" 

#try to create a random url suffix that goes to a random method/path to help you understand 
#random method/path must be defined in our controller and have a view

# delete "sub/:id/" to: "subs#destroy", as: 'destroy_the_sub'
end
