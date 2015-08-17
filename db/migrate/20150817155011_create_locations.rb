class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :hotel_id
      t.string :city
      t.string :state
      t.string :country
      t.string :street

      t.timestamps
    end
  end
end
