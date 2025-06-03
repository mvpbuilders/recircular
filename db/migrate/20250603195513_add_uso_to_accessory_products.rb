class AddUsoToAccessoryProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :accessory_products, :uso, :string
  end
end
