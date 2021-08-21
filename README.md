# tweet_app

ProgateのRuby on Railsコースで作るアプリ

## メモ書き  
・サーバー立ち上げ : `rails server`  
・`top`メソッドを持った`home`コントローラーの作成 : `rails g controller home top`  
・routes.rbの`home#top`は、`home`コントローラーの`top`メソッドを呼ぶという意味 また、対応するhtmlファイル(`top.html.erb`)が表示される  
・`posts/1`, `posts/2`といったルーティングをしたい場合は、`get posts/:id => 'posts#show'`などと書く
・URLは上から探索されることに注意
・パスパラメータは`params[:id]`のようにして取り出せる  
・CSSは`/assets/stylesheets`に配置 コントローラー毎に作られる  
・画像は`/public`に配置 参照は`/`を忘れないように  
・`<% %>`でRubyコードを埋め込める 表示は`<%= %>`を使う  
・`for each`は
```
<% posts.each do |post| %>
...
<% end %>
```
のように書く  
・引数なしの関数の呼び出しは`()`なしで良い  
・テンプレートリテラルは`#{}`を使う  
・アクション内での変数定義には`@`をつける  
・`content`カラムを持つ`Posts`テーブルの作成: `rails g model Post content:text` (`Post`が単数形なのに注意) → `rails db:migrate`  
・コンソールの起動: `rails console` (`quit`で終了)  
・一覧取得には`all`を使う (ex. `Post.all`)  
・レコード取得には`find_by`を使う (ex. `Post.find_by(id: 1)`)  
・データ保存には`save`を使う (ex. `@post.save`)  
・入力の並び替えには`order`を使う (ex. `Post.all.order(created_at: :desc)`)  
・ヘッダーなどの共通レイアウトは`application.html.erb`に書く  
・入力されたデータの送信には`form_tag`を使う
```
<%= form_tag("/posts/create") do %>
    <textarea></textarea>
    <input type="submit" value="投稿">
<% end %>
```
・リダイレクトには`redirect_to`を使う  
・`link_to`はデフォルトだと`GET`のルーティングを探してしまう `POST`のルーティングにマッチさせる場合は、`<%= link_to("削除", "/posts/#{@post.id}/destroy", {method: "post"}) %>`と書く  