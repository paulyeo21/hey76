Rails.application.routes.draw do

  root            'static_pages#search'
  get 'mosaic' => 'static_pages#mosaic'
  resources :draftees
  get 'suggestions.json' => 'draftees#json'

end
