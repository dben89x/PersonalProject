class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :location
      t.string :others
    end
  end
end
