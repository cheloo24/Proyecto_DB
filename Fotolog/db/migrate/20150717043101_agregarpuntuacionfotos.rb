class Agregarpuntuacionfotos < ActiveRecord::Migration
  def change
  	add_column :fotos, :puntuacion_total, :integer, default: 0
  end
end
