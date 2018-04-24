# DB設計

## avatarsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|image|string|null: false, unique: true|

### Association
- has_many :users


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|avatar_id|integer|foreign_key: true|

### Association
- belongs_to :avatar
- has_many :articles
- has_many :comments


## articlesテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|body|text|null: false|
|image|string||
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|

### Association
- has_many :comments
- belongs_to :category


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|article_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :article


## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :articles
