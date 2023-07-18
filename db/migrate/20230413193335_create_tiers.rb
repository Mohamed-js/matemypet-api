class CreateTiers < ActiveRecord::Migration[7.0]
  def change
    create_table :tiers do |t|
      t.string :name
      t.integer :likes
      t.integer :max_file_size
      t.integer :pets
      t.boolean :ads
      t.boolean :has_unlimited_likes

      t.timestamps
    end
  end
end
