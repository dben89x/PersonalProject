class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string "name"
      t.text "description"
      t.string "location"
      t.belongs_to :subcats
    end

    create_table :subscriptions do |t|
      t.belongs_to :user
      t.belongs_to :place
      t.string :status
    end

    create_table :cats do |t|
      t.string :name
    end

    create_table :subcats do |t|
      t.string :name
      t.belongs_to :cat
    end

    create_table :comments do |t|
      t.text :text
      t.belongs_to :user
      t.belongs_to :spot
      t.belongs_to :place
    end

    change_table :spots do |t|
      t.belongs_to :user
      t.belongs_to :place
      t.remove :others
    end
  end
end
