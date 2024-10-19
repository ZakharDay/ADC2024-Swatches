class AddPublicToProject < ActiveRecord::Migration[7.2]
  def change
    add_column :projects, :public, :boolean, default: false
  end
end
