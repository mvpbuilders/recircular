class CreateClothingProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :clothing_products do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :precio
      t.string :genero
      t.string :estado
      t.string :talle
      t.string :talle_zapatilla
      t.string :owner

      t.timestamps
    end
  end
end
