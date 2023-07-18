class CreateUserNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :user_notifications do |t|
      t.integer :user_id
      t.string :body
      t.text :image
      t.string :title
      t.string :redirect_to
      t.integer :redirect_to_id

      t.timestamps
    end
  end
end
