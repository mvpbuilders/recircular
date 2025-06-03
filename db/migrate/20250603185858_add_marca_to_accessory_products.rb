class AddMarcaToAccessoryProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :accessory_products, :marca, :string
  end
end
