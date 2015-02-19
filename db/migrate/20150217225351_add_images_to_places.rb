class AddImagesToPlaces < ActiveRecord::Migration
  def change
    create_table :placeimages do |t|
      t.binary :image
      t.belongs_to :place
      t.belongs_to :user
      t.belongs_to :spot
      t.timestamps
      t.text :comment
      t.boolean :public
    end
  end
end
