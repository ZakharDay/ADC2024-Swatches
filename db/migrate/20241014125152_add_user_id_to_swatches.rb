class AddUserIdToSwatches < ActiveRecord::Migration[7.2]
  def change
    add_column :swatches, :user_id, :integer
  end
end
