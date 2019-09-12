class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.string :image
      t.string :category, array: true, default: []
      t.references :attendant, foreign_key: true

      t.timestamps
    end
  end
end
