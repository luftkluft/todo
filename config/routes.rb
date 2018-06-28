Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    devise_for :users
    get "sorting" => "lists#sorting"
    get '/:locale' => 'landing#landing'
    root 'landing#landing'
    get 'landing/change_locale'
    resources :lists do
      member do
        patch 'complete'
      end
    end
    get '/tasks/new/:id' => 'tasks#new'
    get '/tasks' => 'tasks#index'
    post '/tasks' => 'tasks#create'
    get '/tasks/:id/edit' => 'tasks#edit'
    patch '/tasks/:id' => 'tasks#update'
    put '/tasks/:id' => 'tasks#update'
    delete '/tasks/:id' => 'tasks#destroy'
    resources :tasks
  end
end
