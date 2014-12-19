class ChangeStatusToRole < ActiveRecord::Migration
  def change
    rename_column :subscriptions, :status, :role
  end
end
