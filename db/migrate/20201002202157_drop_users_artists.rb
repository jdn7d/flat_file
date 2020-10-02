class DropUsersArtists < ActiveRecord::Migration[6.0]
  def change
     drop_table :users_artists
  end
end
