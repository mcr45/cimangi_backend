class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, as: :commentable
  #validates :user_id,optional:true
  validates :body, presence:true,length:{minimum:15,maximum:9000}
  validates :title, presence:true, length:{minimum:10,maximum:105}
  validates :category, presence:true,length:{minimum:3,maximum:20}
end
