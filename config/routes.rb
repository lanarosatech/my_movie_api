# config/routes.rb
Rails.application.routes.draw do
  get 'movies', to: 'movies#index'
  resources :movies, only: [] do
    collection do
      post 'upload_csv'
    end
  end
end
