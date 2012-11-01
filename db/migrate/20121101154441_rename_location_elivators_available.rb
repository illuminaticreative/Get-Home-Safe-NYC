class RenameLocationElivatorsAvailable < ActiveRecord::Migration
  def up
    rename_column :locations, :elivators_operational, :elevators_operational
    rename_column :locations, :elivators_available, :elevators_available
  end

  def down
  end
end
