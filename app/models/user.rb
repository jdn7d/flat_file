class User < ActiveRecord::Base
    validates :email, presence: true

    has_many :user_artists
    has_many :artists, through: :user_artists
    has_many :artworks, through: :artists

    has_secure_password
end