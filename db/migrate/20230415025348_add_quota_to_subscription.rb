class AddQuotaToSubscription < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :likes_default, :integer
    add_column :subscriptions, :first_like_date, :datetime
    add_column :subscriptions, :likes_updated, :boolean

    drop_table :quota
  end
end
