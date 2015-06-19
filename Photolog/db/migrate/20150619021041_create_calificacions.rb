class CreateCalificacions < ActiveRecord::Migration
  def change
    create_table :calificacions do |t|
      t.integer :puntuacion

      t.timestamps null: false
    end
  end
end
