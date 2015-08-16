class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :title
      t.string :room_description
      t.string :breakfast
      t.integer :price

      t.timestamps null: false
    end
  end
end
