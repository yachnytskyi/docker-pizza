Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories
      resources :news
      resources :posts
      resources :tags
      resources :post_tags
    end
  end

  post "reflesh", controller: :reflesh, action: :create
  post "signin", controller: :signin, action: :create
  post "signup", controller: :signup, action: :create
  delete "signin", controller: :signin, action: :destroy

end