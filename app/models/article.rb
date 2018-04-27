class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments
  has_many :tags, through: :article_tags
  has_many :article_tags
end
