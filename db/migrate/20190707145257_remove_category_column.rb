class RemoveCategoryColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :category 
  end
end
