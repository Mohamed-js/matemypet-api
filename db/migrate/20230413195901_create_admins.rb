class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :email
      t.string :password
      t.string :name
      t.boolean :is_super

      t.timestamps
    end
  end
end
