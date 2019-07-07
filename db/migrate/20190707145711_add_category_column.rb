class AddCategoryColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :category, :string, array: true, default: []
  end
end
