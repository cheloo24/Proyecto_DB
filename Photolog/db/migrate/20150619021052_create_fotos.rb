class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.datetime :fecha_foto
      t.text :descripcion
      t.integer :n_comentarios

      t.timestamps null: false
    end
  end
end
