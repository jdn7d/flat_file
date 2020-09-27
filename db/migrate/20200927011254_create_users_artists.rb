class CreateUsersArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :users_artists do |t|
      t.integer :user_id
      t.integer :artist_id
      t.timestamps null: false
    end
  end
end
