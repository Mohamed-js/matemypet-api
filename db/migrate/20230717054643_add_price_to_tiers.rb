class AddPriceToTiers < ActiveRecord::Migration[7.0]
  def change
    add_column :tiers, :price, :decimal
  end
end
