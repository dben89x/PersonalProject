class AddStartAndEndTimeToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :start_time, :time
    add_column :spots, :end_time, :time
    remove_column :spots, :time
  end
end
