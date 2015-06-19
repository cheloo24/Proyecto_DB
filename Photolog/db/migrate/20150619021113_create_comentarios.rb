class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.datetime :fecha_comentario
      t.text :texto_comentario

      t.timestamps null: false
    end
  end
end
