class CreateUniformProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :uniform_products do |t|
      t.string :title
      t.text :description
      t.string :tipo
      t.string :subtipo
      t.string :colegio
      t.string :talle_ropa
      t.string :talle_zapatilla
      t.integer :precio
      t.float :distancia
      t.string :condition
      t.string :material
      t.string :color
      t.string :status
      t.string :tags

      t.timestamps
    end
  end
end
