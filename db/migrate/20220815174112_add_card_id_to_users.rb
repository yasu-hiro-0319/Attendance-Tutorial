class AddCardIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :card_id, :integer
  end
end
