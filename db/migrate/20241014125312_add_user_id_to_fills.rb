class AddUserIdToFills < ActiveRecord::Migration[7.2]
  def change
    add_column :fills, :user_id, :integer
  end
end
