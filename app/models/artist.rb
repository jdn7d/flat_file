class Artist < ActiveRecord::Base

    has_many :artworks
    has_many :users_artists
    has_many :users, through: :users_artists
end