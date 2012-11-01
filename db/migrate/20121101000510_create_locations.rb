class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :latitude
      t.string :longitude
      t.boolean :verified
      t.integer :borough_id

      t.timestamps
    end
  end
end
