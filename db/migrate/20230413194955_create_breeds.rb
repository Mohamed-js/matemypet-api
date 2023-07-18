class CreateBreeds < ActiveRecord::Migration[7.0]
  def change
    create_table :breeds do |t|
      t.string :name
      t.integer :type_id

      t.timestamps
    end
  end
end
