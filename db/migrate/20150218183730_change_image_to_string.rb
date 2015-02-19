class ChangeImageToString < ActiveRecord::Migration
  def change
    remove_column :placeimages, :image
    add_column :placeimages, :image, :string
  end
end
