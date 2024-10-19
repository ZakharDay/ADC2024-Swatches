class AddSecretToProjects < ActiveRecord::Migration[7.2]
  def change
    add_column :projects, :secret, :string
  end
end
