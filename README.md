# DB設計


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|avatar|string|foreign_key: true|

### Association
- has_many :articles
- has_many :comments


## articlesテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|body|text|null: false|
|image|string||
|user_id|integer|null: false, foreign_key: true|

### Association
- has_many :comments
- has_many :tags, through: :article_tags
- has_many :article_tags
- belongs_to :user


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|article_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :article


## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :articles, through: :article_tags
- has_many :article_tags

## article_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|article_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :article
- belongs_to :tag

# 機能一覧

## article投稿機能
- ~~投稿(text,image)~~
- ~~削除~~
- 編集

## userログイン機能
- ~~sign_up(+avata)~~
- ~~login~~
- ~~logout~~

## コメント投稿機能
- ~~投稿~~

## tag付け機能
- 投稿時のタグ選択
- タグ検索

## search機能
- 記事検索(title + body)
- user検索

## Goodボタン機能
- ~~記事に対してGood(非同期通信)~~

## ランキング表示機能
- tag付けランキング
- ~~good数ランキング~~

## お気に入りユーザー機能
- お気に入りユーザーの記事一覧表示

## View javascript
- headerのメニュータブ
