Rails.application.routes.draw do


  get 'session/new'
  match 'login', :to => 'session#new', :via => :get
  match 'logout', :to => 'session#destroy', :via => :get
  match 'session/create', :to => 'session#create', :via => :post

  get 'users/new'
  match 'register', :to => 'users#new', :via => :get
  match 'users/create', :to=> "users#create", :via => :post
  match 'profile', :to => "users#show", :via => :get
  match 'users/show', :to=> "users#show", :via => :get


  get 'projects/show'
  match 'projects' , :to => "projects#index", :via => :get,  :as => 'show_projects'
  match 'projects/:project_id' , :to => "projects#show", :via => :get
  match 'projects/new' , :to => "projects#new", :via => :get
  match 'projects/create' , :to => "projects#create", :via => :post

  match 'projects/:project_id/repository/create' , :to => "repository#create", :via => :post
  match 'projects/:project_id/sites/create' , :to => "sites#create", :via => :post



  get 'secrets/new'
  get 'secrets/show'
  match 'secrets/create', :to => 'secrets#create', :via => :post

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
