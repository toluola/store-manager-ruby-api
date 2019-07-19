class AddRoleColumnToAttendant < ActiveRecord::Migration[5.0]
  def change
    add_column :attendants, :role, :string, :default => "attendant"
  end
end
