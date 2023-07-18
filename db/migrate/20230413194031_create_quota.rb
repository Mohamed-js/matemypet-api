class CreateQuota < ActiveRecord::Migration[7.0]
  def change
    create_table :quota do |t|
      t.integer :user_id
      t.integer :subscription_id
      t.integer :likes
      t.boolean :has_unlimited_likes
      t.boolean :likes_updated
      t.datetime :first_like_date
      t.integer :max_file_size
      t.integer :pets

      t.timestamps
    end
  end
end
