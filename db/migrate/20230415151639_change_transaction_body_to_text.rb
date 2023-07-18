class ChangeTransactionBodyToText < ActiveRecord::Migration[7.0]
  def change
    change_column :transactions, :body, :text
  end
end
