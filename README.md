# DB設計


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|avatar|string|foreign_key: true|

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
- has_many :tags, through: :article_tags
- has_many :article_tags


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




