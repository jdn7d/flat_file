class User < ActiveRecord::Base
    validates :email, presence: true
    has_many :artists
    has_many :artworks, through: :artists

    has_secure_password
end