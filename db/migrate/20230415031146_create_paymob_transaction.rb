class CreatePaymobTransaction < ActiveRecord::Migration[7.0]
  def change
    create_table :paymob_transactions do |t|
      t.text :data
      t.integer :t_id

      t.timestamps
    end
  end
end
