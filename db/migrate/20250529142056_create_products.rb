class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :tipo
      t.string :subtipo
      t.string :condition
      t.string :material
      t.string :color
      t.string :talle_ropa
      t.string :talle_zapatilla
      t.integer :precio
      t.integer :distancia
      t.integer :width
      t.integer :height
      t.integer :depth
      t.string :status
      t.string :tags

      t.timestamps
    end
  end
end
