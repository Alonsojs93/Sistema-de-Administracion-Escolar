class AddRolToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rol, :string, default: "alumno"
  end
end
