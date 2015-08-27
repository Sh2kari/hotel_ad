class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :hotel_id
      t.integer :value

      t.timestamps null: false
    end
  end
end
