class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :blocker_id

      t.timestamps
    end
  end
end
