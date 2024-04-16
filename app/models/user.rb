class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :comments
    has_many :recipes
    has_many :likes
    validates :username,:first_name, :last_name, :email, presence:true, uniqueness:true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
