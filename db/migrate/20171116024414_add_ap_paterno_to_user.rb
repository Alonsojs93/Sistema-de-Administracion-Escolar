class AddApPaternoToUser < ActiveRecord::Migration
  def change
    add_column :users, :apPaterno, :string
  end
end
