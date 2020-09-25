class CreateArtworks < ActiveRecord::Migration[6.0]
  def change
      create_table :artworks do |t|
        t.string :title
        t.string :medium
        t.string :location
        t.text :notes
        t.integer :artist_id
  
        t.timestamps null: false
      end
    end
end
