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
・テンプレートリテラルは`#{}`を使う(ダブルクウォートでしか使えない)  
・アクション内での変数定義には`@`をつける  
・`name`カラムと`email`カラムを持つ`users`テーブルの作成: `rails g model User name:string email:string` (`User`が単数形なのに注意) → `rails db:migrate`  
・コンソールの起動: `rails console` (`quit`で終了)  
・一覧取得には`all`を使う (ex. `Post.all`)  
・1件のレコード取得には`find_by`を使う (ex. `Post.find_by(id: 1)`)  
・複数件のレコード取得には`where`を使う (ex. `Post.where(user_id: 1)`)  
・データ保存には`save`を使う (ex. `@post.save`)  
・入力の並び替えには`order`を使う (ex. `Post.all.order(created_at: :desc)`)  
・件数の取得は`count`を使う (ex. `Like.where(post_id: 1).count`)  
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
・ HTML要素に対して、`link_to`を使う場合は、
```
<%= link_to("URL") do %>
HTML
<% end %>
```
のように書く  
・バリデーションは`app/models/post.rb`等に書く 空の投稿を防ぐ場合、以下のようになる
```
class Post < ApplicationRecord
    validates :content, {presence: true}
end
```  
・最大文字数を140文字にする場合のバリデーション `validates :content, {length: {maximum: 140}}`  
・一意性のバリデーション `validates :email, {uniqueness: true}`  
・バリデーションの複数指定も可  ex. `validates :content, {presence: true, length: {maximum: 140}}`  
・バリデーションを通った場合、`save`メソッドは`true`、通らなかった場合は`false`を返す  
・`render(フォルダ名/ファイル名)`を使うことで、別のアクションを経由せずに、直接ビューを表示できる  
・`save`メソッドに失敗したオブジェクトの`errors.full_messages`にエラー内容が配列で入る  
・投稿完了メッセージ等の一度だけ表示したいメッセージは`flash[:notice]`に代入する  
・マイグレーションファイルの作成は`rails g migration ファイル名`を使う 作成されるファイル名の先頭には作成日時が自動でつく  
・カラムを追加する場合、マイグレーションファイルに`add_column :テーブル名, :カラム名, :データ型`と書く カラムを削除する場合は`add_column`→`remove_column`  
・画像を送信する場合、`form_tag`の第二引数で、`{multipart: true}`を指定する  
・フォームから送信された画像を保存するときは、`File.binwrite`を使う  
・バリデーション以外のエラーメッセージは自作する必要がある  
・セッション情報は変数`session`で保持する ex. `session[:user_id] = @user.id` `session[:user_id] = nil`
・セッション情報の削除は`post`を指定する  
・各アクションの実行前に行いたい処理は`before_action`を使う  
```
before_action :set_current_user
def set_current_user
    @current_user = User.find_by(id: session[:user_id])
end
```  
・全てのコントローラーで共通する処理は`application`コントローラーにまとめる(他のコントローラーは`application`コントローラーを継承している)  
・`before_action`を特定のアクションにのみ適用する場合は、`before_action :authenticate_user, {only: [:edit, :update]}`のように書く  
・@変数は同じクラスの異なるメソッドで共通して使うことができる  
・Rubyのライブラリのことをgemという(パッケージ管理システムとしての意味も持つ)  
・`Gemfile`を編集し、`bundle install`することで、`Gemfile`に書かれたGemをインストールすることができる  