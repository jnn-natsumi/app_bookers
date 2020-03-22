Rails.application.routes.draw do
  get 'booklists/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'homes#top'
  post 'books' => 'booklists#create'

  get  'books' => 'booklists#index', as:'booklists'
  # indexをつけた①⇨controllerにindexアクションを追加する
  get 'books/:id/' => 'booklists#show', as:'booklist'

  get 'books/:id/edit' => 'booklists#edit', as: 'edit_booklist'

  patch 'books/:id' => 'booklists#update',  as:'update_booklist'
  # 削除機能をつくる
  delete 'books/:id' => 'booklists#destroy', as:'destroy_booklist'
end
