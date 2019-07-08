class AddCreatedbyColumnToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :created_by, :integer
  end
end
