class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :tier_id
      t.boolean :has_unlimited_likes
      t.integer :likes
      t.integer :max_file_size
      t.integer :pets
      t.boolean :ads

      t.timestamps
    end
  end
end
