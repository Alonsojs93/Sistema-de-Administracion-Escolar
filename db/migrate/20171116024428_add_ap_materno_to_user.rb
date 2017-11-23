class AddApMaternoToUser < ActiveRecord::Migration
  def change
    add_column :users, :apMaterno, :string
  end
end
