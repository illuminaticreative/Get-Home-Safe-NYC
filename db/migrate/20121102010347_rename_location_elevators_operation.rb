class RenameLocationElevatorsOperation < ActiveRecord::Migration
  def up
    rename_column :locations, :elevators_operational, :elevators_safe
  end

  def down
  end
end
