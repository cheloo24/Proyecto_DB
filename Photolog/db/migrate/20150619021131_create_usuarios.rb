class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :apodo
      t.string :password
      t.string :nombre
      t.string :apellido
      t.integer :edad
      t.string :email
      t.integer :n_fotos

      t.timestamps null: false
    end
  end
end
