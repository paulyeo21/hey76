Rails.application.routes.draw do
  root "welcome#index"

  resources :draftees, only: [:index, :show]
  # resources :posts, only: [:create, :destroy]

  namespace :api, path: "", defaults: { format: "json" } do
    namespace :v1 do
      resources :draftees, only: [:index]
    end
  end
end
