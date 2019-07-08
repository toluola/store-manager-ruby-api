class CreateAttendants < ActiveRecord::Migration[5.0]
  def change
    create_table :attendants do |t|
      t.string :name
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
