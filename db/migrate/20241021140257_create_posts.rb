class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :teaser
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :swatch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
