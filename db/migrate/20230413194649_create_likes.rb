class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :liker_animal_id
      t.integer :liker_user_id
      t.integer :liked_animal_id
      t.integer :liked_user_id
      t.boolean :is_liked_back

      t.timestamps
    end
  end
end
