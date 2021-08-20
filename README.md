# tweet_app

ProgateのRuby on Railsコースで作るアプリ

## メモ書き  
・サーバー立ち上げ : `rails server`  
・`top`メソッドを持った`home`コントローラーの作成 : `rails g controller home top`  
・routes.rbの`home#top`は、`home`コントローラーの`top`メソッドを呼ぶという意味 また、対応するhtmlファイル(`top.html.erb`)が表示される  
・CSSは`/assets/stylesheets`に配置  
・画像は`/public`に配置 参照は`/`を忘れないように  
・`<% %>`でRubyコードを埋め込める 表示は`<%= %>`を使う  
・`for each`は
```
<% posts.each do |post| %>
...
<% end %>
```
のように書く  
・アクション内での変数定義には`@`をつける  
・`content`カラムを持つ`Posts`テーブルの作成: `rails g model Post content:text` (`Post`が単数形なのに注意) → `rails db:migrate`  
・コンソールの起動: `rails console` (`quit`で終了)  
・ヘッダーなどの共通レイアウトは`application.html.erb`に書く