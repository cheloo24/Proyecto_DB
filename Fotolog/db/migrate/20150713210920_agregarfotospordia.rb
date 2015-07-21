class Agregarfotospordia < ActiveRecord::Migration
  def change
  	  	add_column :users, :fotos_diarias, :integer, default: 0
  end
end
