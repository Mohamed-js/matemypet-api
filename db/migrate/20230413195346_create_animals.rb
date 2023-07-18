class CreateAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :animals do |t|
      t.integer :user_id
      t.integer :breed_id
      t.string :name
      t.string :gender
      t.text :bio
      t.datetime :dob
      t.boolean :vaccinated
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
