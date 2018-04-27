class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  def create_date
    created_at.strftime("%Y/%m/%d %H:%M")
  end
end

