class AddStatusToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :elevator_status, :string, :null => false, :default => 'N/A'
  end
end
