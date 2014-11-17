class AddTimeFieldsToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :date, :date
    add_column :spots, :created_at, :datetime
    add_column :spots, :updated_at, :datetime
  end
end
