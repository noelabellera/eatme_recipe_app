class User < ApplicationRecord
    has_secure_password
    
    has_many :recipes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    validates :email, presence: true, uniqueness: true
end
