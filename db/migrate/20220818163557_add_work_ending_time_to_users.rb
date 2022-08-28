class AddWorkEndingTimeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :work_ending_time, :datetime
  end
end
