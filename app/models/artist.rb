class Artist < ActiveRecord::Base
    has_many :artworks
    has_many :users_artist
    has_many :users, through: :users_artist
end