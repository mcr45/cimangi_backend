class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  validates :title,:body, presence: true
  validates :body,length: {in:20..256}
end
