Rails.application.routes.draw do

  root            'static_pages#home'
  get 'mosaic' => 'static_pages#mosaic'
  post 'search' => 'static_pages#search'

  get 'suggestions.json' => 'draftees#json'
  resources :draftees

end
