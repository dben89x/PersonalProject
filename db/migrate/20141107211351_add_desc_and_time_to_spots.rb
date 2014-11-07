class AddDescAndTimeToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :description, :string
    add_column :spots, :time, :time
  end
end
