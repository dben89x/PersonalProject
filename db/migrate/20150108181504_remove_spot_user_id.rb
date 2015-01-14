class RemoveSpotUserId < ActiveRecord::Migration
  def change
    remove_column :spots, :user_id
  end
end
