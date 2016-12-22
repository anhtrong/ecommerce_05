class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.string :image
      t.float :rating, default: 0.0
      t.integer :quantity
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
