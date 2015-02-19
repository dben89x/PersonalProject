class ChangeImageTableAgain < ActiveRecord::Migration
  def change
    drop_table :images
    create_table :pics do |t|
      t.string :image
      t.belongs_to :place
      t.belongs_to :user
      t.belongs_to :spot
      t.timestamps
      t.text :comment
      t.boolean :public
    end
  end
end
