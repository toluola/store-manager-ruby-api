class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.text :category
      t.string :image

      t.timestamps
    end
  end
end
