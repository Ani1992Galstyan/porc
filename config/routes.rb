Rails.application.routes.draw do
 root "admin/posts#index"
 devise_for :users
   namespace :admin do 
   	resources :posts
   	resources :categories
   	get 'posts/:id/count', to: 'posts#view_count', as: 'view_count'

   end
  get 'search', to: 'admin/posts#search'

end
