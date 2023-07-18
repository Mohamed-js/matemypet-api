class CreateAdViews < ActiveRecord::Migration[7.0]
  def change
    create_table :ad_views do |t|
      t.boolean :is_liked
      t.string :longitude
      t.string :latitude
      t.string :country
      t.string :city
      t.integer :ad_id
      t.integer :user_id

      t.timestamps
    end
  end
end
