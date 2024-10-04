class CreateColors < ActiveRecord::Migration[7.2]
  def change
    create_table :colors do |t|
      t.integer :stop, default: 100
      t.string :color
      t.integer :alpha, default: 100
      t.references :fill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
