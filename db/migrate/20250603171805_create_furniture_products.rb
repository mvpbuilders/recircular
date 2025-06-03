class CreateFurnitureProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :furniture_products do |t|
      t.string :title
      t.text :description
      t.string :tipo
      t.string :subtipo
      t.string :condition
      t.string :material
      t.string :color
      t.integer :precio
      t.float :distancia
      t.string :status
      t.string :tags
      t.string :owner

      t.timestamps
    end
  end
end
