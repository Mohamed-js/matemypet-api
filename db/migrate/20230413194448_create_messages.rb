class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :chat_id
      t.integer :sender_id
      t.integer :receiver_id
      t.text :body
      t.boolean :seen
      t.boolean :is_multimedia
      t.boolean :is_video
      t.text :tumbnail

      t.timestamps
    end
  end
end
