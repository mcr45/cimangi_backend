class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  validates :body,length:{minimum:1,maximum:200},presence:true
  
end
