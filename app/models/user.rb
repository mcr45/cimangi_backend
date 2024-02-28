class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :comments
    has_many :recipes
    validates :username,:first_name, :last_name, :email, presence:true
end
