class AddPublicToSwatch < ActiveRecord::Migration[7.2]
  def change
    add_column :swatches, :public, :boolean, default: false
  end
end
