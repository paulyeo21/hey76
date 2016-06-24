Rails.application.routes.draw do
  root "welcome#index"

  get 'mosaic' => 'static_pages#mosaic'
  resources :draftees, only: [:index, :show]
  resources :inserts, only: [:create, :destroy]

  namespace :api, path: "", defaults: { format: "json" } do
    namespace :v1 do
      resources :draftees, only: [:index]
    end
  end
end
