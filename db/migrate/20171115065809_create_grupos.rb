class CreateGrupos < ActiveRecord::Migration
  def change
    drop_table :grupos
    create_table :grupos do |t|
      t.belongs_to :user, index: true
      t.belongs_to :user, index: true
      t.belongs_to :asignatura, index: true
      t.float :calificacion
      t.string :grupo

      t.timestamps null: false
    end
  end
end
