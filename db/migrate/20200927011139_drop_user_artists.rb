class DropUserArtists < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_artists
  end
end
