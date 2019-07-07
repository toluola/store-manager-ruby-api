class ChangeCategoryColumnToArray < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :category, :text, array: true, default: [], using: "(string_to_array(category, ','))"
  end
end
