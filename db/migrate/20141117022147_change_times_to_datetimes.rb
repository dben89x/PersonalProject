class ChangeTimesToDatetimes < ActiveRecord::Migration
  def change
    remove_column :spots, :start_time, :time
    remove_column :spots, :end_time, :time
    add_column :spots, :start_time, :datetime
    add_column :spots, :end_time, :datetime
  end
end
