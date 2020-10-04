class User < ActiveRecord::Base
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, presence: true, length: {minimum: 6}

    has_many :artists
    has_many :artworks, through: :artists

    has_secure_password
end