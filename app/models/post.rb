class Post < ApplicationRecord
  belongs_to :user
  validates :title,:body, presence: true
  validates :body,length: {in:20..256}
end
