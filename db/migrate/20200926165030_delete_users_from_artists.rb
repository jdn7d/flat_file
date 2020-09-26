class DeleteUsersFromArtists < ActiveRecord::Migration[6.0]
  def change
    remove_column :artists, :user_id, :integer
  end
end
