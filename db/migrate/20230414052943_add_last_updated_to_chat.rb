class AddLastUpdatedToChat < ActiveRecord::Migration[7.0]
  def change
    add_column :chats, :last_updated, :datetime
  end
end
