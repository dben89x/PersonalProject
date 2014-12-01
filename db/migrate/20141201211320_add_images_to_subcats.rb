class AddImagesToSubcats < ActiveRecord::Migration
  def change
    add_column :subcats, :image, :binary
    add_column :subcats, :role, :string
  end
end
