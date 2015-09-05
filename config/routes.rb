Rails.application.routes.draw do

  root            'draftees#index'
  get 'mosaic' => 'static_pages#mosaic'
  post 'search' => 'draftees#search'

  get 'suggestions.json' => 'draftees#json'
  resources :draftees

end
