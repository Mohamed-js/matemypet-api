class ChangeLongitudeAndLatitudeTypes < ActiveRecord::Migration[7.0]
  def change
    remove_column :animals, :longitude
    remove_column :animals, :latitude
    remove_column :users, :longitude
    remove_column :users, :latitude

    add_column :animals, :longitude, :decimal
    add_column :animals, :latitude, :decimal
    add_column :users, :longitude, :decimal
    add_column :users, :latitude, :decimal
  end
end
