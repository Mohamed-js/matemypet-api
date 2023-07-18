class CreateDislikes < ActiveRecord::Migration[7.0]
  def change
    create_table :dislikes do |t|
      t.integer :disliker_animal_id
      t.integer :disliker_user_id
      t.integer :disliked_animal_id

      t.timestamps
    end
  end
end
