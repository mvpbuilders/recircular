class CreateOtherProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :other_products do |t|
      t.string :title
      t.text :description
      t.string :tipo
      t.string :subtipo
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
