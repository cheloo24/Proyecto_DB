class CreateComents < ActiveRecord::Migration
  def change
    create_table :coments do |t|
      t.references :foto, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.date :fecha_comentario
      t.text :texto_comentario
      t.string :anonimo

      t.timestamps null: false
    end
  end
end
