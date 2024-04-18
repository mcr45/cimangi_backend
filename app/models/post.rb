class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :liked_by, class_name:"Like"
  validates :title,:body, presence: true
  validates :body,length: {in:20..9956}
end
