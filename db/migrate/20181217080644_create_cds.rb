class CreateCds < ActiveRecord::Migration[5.2]
  def change
    create_table :cds do |t|
      t.string :name
      t.integer :price
      t.integer :artist_id

      t.timestamps
    end
  end
end
