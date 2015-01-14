class AddDefaultValueToSpotDate < ActiveRecord::Migration
  def change
    change_column :spots, :start_time, :datetime, default: Time.now
  end
end
