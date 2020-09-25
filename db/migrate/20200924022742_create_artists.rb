class CreateArtists < ActiveRecord::Migration[6.0]
  def change
      create_table :artists do |t|
        t.string :name
        t.text :notes
        t.integer :user_id
  
        t.timestamps null: false
      end
    end
  
end
