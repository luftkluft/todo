Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ru/ do
    devise_for :users
    get 'sorting' => 'lists#sorting'
    get '/:locale' => 'landing#landing'
    root 'landing#landing'
    get 'landing/change_locale'
    resources :lists do
      member do
        patch 'complete'
      end
    end
    resources :tasks
  end
end
