# Simic

"Simic"は、「作品の内容をざっくり把握してから読みたい人向け」の漫画レビュー投稿サイトです。


# DEMO

<img width="1000" alt="simicdemo" src="https://user-images.githubusercontent.com/54733523/69858902-5cf3bc00-12d6-11ea-9a2d-8bfc8234fafb.png">


# Requirement

* Ruby 2.5.5
* Rails 5.2.3

ライブラリ
* devise 4.7.1 (ログイン、ユーザ登録機能)
* acts-as-taggable-on 6.5.0 (タグ機能)
* ransack 2.3.0 (検索機能)
* ratyrate 1.2.2.alpha (5段階評価機能)
* kaminari 1.1.1 (ページネーション機能)


# Usage

DEMOの実行方法など、"hoge"の基本的な使い方を説明する
* ユーザ登録機能　→　サインアップ・ログイン・退会処理を行います。
* レビュー投稿機能　→　タイトル検索でGoogle Books APIより作品情報を取得し、レビュー投稿ができます。
* 5段階評価機能　→　レビュー投稿時に星の数で5段階評価ができます。
* タグ機能　→　レビュー投稿時に作品を表すキーワードタグを自由に付けられます。
* レビュー作品検索機能　→　レビューされた作品を「タイトル」「作家名」「タグ」で検索ができます。


# Author

* 作成者　Aoyagi Kozue

