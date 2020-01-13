Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :books
#get "top" => "books#top" 元のコード
# ルーティングの設定
root :to => "books#top"
# # newへのルーツを消してindexにまとめた
# get "books" => "bookers#index"

# post "books" => "bookers#create"

# get "books/:id" => "bookers#show",as: "bookers"

# get "books/:id/edit" => "bookers#edit",as: "edit_bookers"

# patch "books/:id" => "bookers#update",as: "update_bookers"
# # メソッドはdelete アクション名はdestroy
# delete "books/:id" => "bookers#destroy"

 end
