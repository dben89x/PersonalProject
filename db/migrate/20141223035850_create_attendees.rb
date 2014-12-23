class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.belongs_to :user
      t.belongs_to :spot
      t.string  :role
      t.boolean :arrived
      t.boolean :attending
    end
  end
end
