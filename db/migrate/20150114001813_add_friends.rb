class AddFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.belongs_to :user
      t.integer :friend_id
    end
  end
end
