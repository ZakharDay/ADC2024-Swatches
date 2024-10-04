class CreateSwatches < ActiveRecord::Migration[7.2]
  def change
    create_table :swatches do |t|
      t.string :name
      t.integer :project_id

      t.timestamps
    end
  end
end
