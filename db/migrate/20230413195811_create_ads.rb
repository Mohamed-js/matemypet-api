class CreateAds < ActiveRecord::Migration[7.0]
  def change
    create_table :ads do |t|
      t.string :owner
      t.integer :priority
      t.string :link_to_ad
      t.integer :views
      t.string :app_appearance_place
      t.text :image
      t.string :caption
      t.integer :duration_in_days
      t.boolean :is_expired

      t.timestamps
    end
  end
end
