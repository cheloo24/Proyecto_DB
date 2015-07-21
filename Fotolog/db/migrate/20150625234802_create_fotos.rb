class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.references :user, index: true, foreign_key: true
      t.datetime :fecha_foto
      t.text :descripcion
      t.integer :n_comentarios

      t.timestamps null: false
    end
  end
end
