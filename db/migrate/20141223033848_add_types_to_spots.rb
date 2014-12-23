class AddTypesToSpots < ActiveRecord::Migration
  def change
    add_column :places, :kind, :string

    create_table :info do |t|
      t.integer :rating
      t.boolean :like
      t.integer :service
      t.boolean :familiar
      t.integer :experience
      t.text :activities
      t.integer :crowd
      t.integer :price
      t.belongs_to :place
      t.belongs_to :spot
      t.belongs_to :user
    end
  end
end
