class RemoveLocationFromSpot < ActiveRecord::Migration
  def change
    remove_column :spots, :location
  end
end
