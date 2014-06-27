Gtcbe::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
	# Static pages
	root 'static_pages#home'
	#root 'blogposts#index'
	match '/register', to: 'users#new', via: 'get'
	match '/login', to: 'sessions#new', via: 'get'
	match '/logout', to: 'sessions#destroy', via: 'delete'
	match '/blog', to: 'blogposts#index' , via: 'get'
	match '/wiki', to: 'wiki_pages#home', via: 'get'

	
	#users
	resources :users, only: [ :new, :create, :show, :edit, :update]
	
	#sessions
	resources :sessions, only: [ :create, :destroy ]
	
	#blogposts
	resources :blogposts, only: [ :index, :show ]
	
	#comments
	resources :comments, only: [ :new, :create, :show, :edit, :update ] do
		member do
			patch 'upvote'
			patch 'downvote'
		end
	end
	
	#wiki pages
	resources :wiki_pages, only: [ :show ] do
		member do
			get 'home'
		end
	end
	
	#admin
	namespace :admin do
		get '', to: 'dashboard#index', as: '/'
		
		resources :users
		resources :blogposts
		resources :wiki_pages
		resources :wiki_hierarchies
		
		get "wiki_pages/new/*page_name", to: "wiki_pages#new"
	end
	
	DynamicRouter.load
	
	get "wiki/*page_name", to: "wiki_pages#default"
	
 end