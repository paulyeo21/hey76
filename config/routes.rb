Rails.application.routes.draw do

  root            'draftees#home'
  get 'mosaic' => 'static_pages#mosaic'
  post 'search' => 'draftees#search'
  get 'suggestions.json' => 'draftees#json'
  resources :draftees
  resources :inserts
  # , only: [:create, :destroy]

end
