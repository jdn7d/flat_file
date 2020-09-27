class User < ActiveRecord::Base
    validates :email, presence: true
    validates :username, uniqueness: true

    has_many :users_artists
    has_many :artists, through: :users_artists
    has_many :artworks, through: :artists

    has_secure_password
end