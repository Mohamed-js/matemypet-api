class CreateUserReports < ActiveRecord::Migration[7.0]
  def change
    create_table :user_reports do |t|
      t.integer :user_id
      t.integer :reported_id
      t.string :reported_type
      t.text :body
      t.text :image
      t.boolean :read

      t.timestamps
    end
  end
end
