class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :latitude
      t.string :longitude
      t.boolean :verified
      t.integer :borough_id
      t.boolean :safe
      t.boolean :power
      t.boolean :heat
      t.boolean :water
      t.boolean :flooding
      t.boolean :elivators_available
      t.boolean :elivators_operational
      t.timestamps
    end
  end
end
