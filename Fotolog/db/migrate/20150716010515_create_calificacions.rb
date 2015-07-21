class CreateCalificacions < ActiveRecord::Migration
  def change
    create_table :calificacions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :foto, index: true, foreign_key: true
      t.integer :puntuacion

      t.timestamps null: false
    end
  end
end
