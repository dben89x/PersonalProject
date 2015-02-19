class ChangeImageToString < ActiveRecord::Migration
  def change
    remove_column :images, :image
    add_column :images, :image, :string
  end
end
