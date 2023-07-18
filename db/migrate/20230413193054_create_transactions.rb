class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :body
      t.integer :user_id
      t.integer :tier_id
      t.decimal :value
      t.integer :service_transaction_id

      t.timestamps
    end
  end
end
