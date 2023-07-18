class CreateAvatars < ActiveRecord::Migration[7.0]
  def change
    create_table :avatars do |t|
      t.integer :animal_id
      t.text :url
      t.string :caption

      t.timestamps
    end
  end
end
