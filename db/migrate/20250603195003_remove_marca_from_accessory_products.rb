class RemoveMarcaFromAccessoryProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :accessory_products, :marca, :string
  end
end
